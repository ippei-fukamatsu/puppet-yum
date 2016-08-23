# = Class: yum::repo::rpmforge
#
# This class installs the rpmforge repo
#
class yum::repo::rpmforge {
$osver = split($::operatingsystemrelease, '[.]')
  case $osver[0] {
    '7': {
      $baseurl = 'http://ftp.riken.jp/Linux/dag/redhat/el7/en/$basearch/rpmforge'
      $mirrorlist = 'http://ftp.riken.jp/Linux/dag/redhat/el7/en/mirrors-rpmforge'
    }
    '6': {
      $baseurl = 'http://ftp.riken.jp/Linux/dag/redhat/el6/en/$basearch/rpmforge'
      $mirrorlist = 'http://ftp.riken.jp/Linux/dag/redhat/el6/en/mirrors-rpmforge'
    }
    '5': {
      $baseurl = 'http://ftp.riken.jp/Linux/dag/redhat/el5/en/$basearch/rpmforge'
      $mirrorlist = 'http://ftp.riken.jp/Linux/dag/redhat/el5/en/mirrors-rpmforge'
    }
    default: { fail('Unsupported version of Enterprise Linux') }
  }
  yum::managed_yumrepo { 'rpmforge':
    baseurl       => $baseurl,
    mirrorlist    => $mirrorlist,
    descr         => 'RHEL $releasever - RPMforge.net - dag',
    enabled       => 1,
    gpgcheck      => 1,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
    gpgkey_source => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
    priority      => 30,
  }

}

