Return-Path: <SRS0=Whi+=RO=gmail.com=zenmchen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA52AD3C550
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Oct 2024 06:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2E21C4CEC5; Fri, 18 Oct 2024 06:33:17 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEB23C4CED0
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 06:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEB23C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e579abb99so1228782b3a.2
        for <linux-firmware@kernel.org>; Thu, 17 Oct 2024 23:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729233195; x=1729837995; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPBCHFtWQm28pzyYtChYz4fVb3AGGj8qQi4p360VFSE=;
        b=f+QPyxqLSwq7GOHA/bihJCC7eSVrkQs9mZIumsv5I/h4R75YHcO6C5s7yJb6qTGoJl
         lCouH/wFjguZMDKfc569aCJeLu1ImEp5gkN5IXUXBK3SNgQuRPjnUfNeYPizMXLCfvs9
         AYJxMnri5Zl0TPbNQL7w4GxP0V/Z6PjGuZu9mrobJ6kqo3+d7cHUBg0LXloGxb5WG5HB
         jB3hQYl+6wXLltLyH9ahFQDW4a185j7fzg1VAr8oWYNexzxBZH2yNVmKCm4qzDAYPzlD
         J3F+1BFg7KZoQn8F6Us1Eb9JkNyroOJc4r6naq0NXUZkvHyQTuZRdJqw71PZNekrbNdi
         WZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729233195; x=1729837995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPBCHFtWQm28pzyYtChYz4fVb3AGGj8qQi4p360VFSE=;
        b=crebEooVGJwbKxMgKDIhSt4KxEsyZCnE4Vkc4I76nZ5EPwFftSs5DgxmLLFqMhrSaJ
         6CKLx15PM3ciLsGne588WfdcbpXQ6ThCCGSNk1Xgl/pezHxnHIJa6ZjeiN1SInncZve4
         fAO5ZTOOhr1I8vR1Y0Ym6TUVy3KWe19fQlzXE96n0Nahdq7aHbFhHIoqtK+aS4OhbSFc
         BcB+i3rani3hlu6ju2AdA1+cfX3nevtUw9gP3DEki8Af0x5v4mqGrlkS06V4V53X/sOj
         Ah1hstxzSEet0amJvnTfg1S9Zf/mecV6Dmaq4Cm2OhAATKdzlZOzg2M6bXKB5Yf8qcka
         s4fQ==
X-Gm-Message-State: AOJu0YzGT7f+p4v9Gk6kgf4wIqj/1p/ND4RMVVU41P2Otk//ayeUqruu
	EZ1dx7LMm/DB7wLVa2BqgF4Yjm/g8TKgodvZ1unzr81y3t6O947K
X-Google-Smtp-Source: AGHT+IGVQoMcJL+bhNszv2YjwKqzM+Qq0RLdj5aGPIMtoxiMVDkMA7tZc3pUSFOHV9V5/7qMGsNnYw==
X-Received: by 2002:a05:6a00:848:b0:71e:55e2:2c54 with SMTP id d2e1a72fcca58-71ea31b1366mr2129063b3a.12.1729233194889;
        Thu, 17 Oct 2024 23:33:14 -0700 (PDT)
Received: from BM5220.hitronhub.home ([2407:4d00:9c00:839f::9e3b])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71ea3459ad8sm707888b3a.162.2024.10.17.23.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 23:33:14 -0700 (PDT)
From: Zenm Chen <zenmchen@gmail.com>
To: pkshih@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
	linux-wireless@vger.kernel.org,
	rtl8821cerfe2@gmail.com,
	zenmchen@gmail.com
Subject: RE: [PATCH 2/2] rtlwifi: Remove unused firmware images
Date: Fri, 18 Oct 2024 14:33:10 +0800
Message-ID: <20241018063310.4844-1-zenmchen@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <7b298bde63ef426bb01ea463c783d9e3@realtek.com>
References: <7b298bde63ef426bb01ea463c783d9e3@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ping-Ke Shih <pkshih@realtek.com> wrote:
> I have confirmed these files are not used, but distro can select and pick
> firmware by module info. Not sure if cleanup is necessary.

Hi,

I checked some polular distros and all of them install these unused
firmware into their system, so I think cleanup is needed...maybe?

=================================================================

$ cat /etc/*-release

NAME="Arch Linux"
PRETTY_NAME="Arch Linux"
ID=arch
BUILD_ID=rolling
ANSI_COLOR="38;2;23;147;209"
HOME_URL="https://archlinux.org/"
DOCUMENTATION_URL="https://wiki.archlinux.org/"
SUPPORT_URL="https://bbs.archlinux.org/"
BUG_REPORT_URL="https://gitlab.archlinux.org/groups/archlinux/-/issues"
PRIVACY_POLICY_URL="https://terms.archlinux.org/docs/privacy-policy/"
LOGO=archlinux-logo

$ cd /lib/firmware/rtl_bt
$ ls -l *8192* *8812*
-rw-r--r-- 1 root root 18K Sep  9 20:24 rtl8192ee_fw.bin.zst
-rw-r--r-- 1 root root 18K Sep  9 20:24 rtl8192eu_fw.bin.zst
-rw-r--r-- 1 root root 19K Sep  9 20:24 rtl8812ae_fw.bin.zst

$ cd ../rtlwifi/
$ ls -l rtl8192eu* rtl8723bu* rtl8723bs_bt* rtl8723defw* rtl8822befw*
-rw-r--r-- 1 root root  13K Sep  9 20:24 rtl8192eu_ap_wowlan.bin.zst
-rw-r--r-- 1 root root  20K Sep  9 20:24 rtl8192eu_nic.bin.zst
-rw-r--r-- 1 root root  18K Sep  9 20:24 rtl8192eu_wowlan.bin.zst
-rw-r--r-- 1 root root 6.3K Sep  9 20:24 rtl8723bs_bt.bin.zst
-rw-r--r-- 1 root root  14K Sep  9 20:24 rtl8723bu_ap_wowlan.bin.zst
-rw-r--r-- 1 root root  20K Sep  9 20:24 rtl8723bu_nic.bin.zst
-rw-r--r-- 1 root root  17K Sep  9 20:24 rtl8723bu_wowlan.bin.zst
-rw-r--r-- 1 root root  17K Sep  9 20:24 rtl8723defw.bin.zst
-rw-r--r-- 1 root root  64K Sep  9 20:24 rtl8822befw.bin.zst

=======================================================================

$  cat /etc/*-release
PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
NAME="Debian GNU/Linux"
VERSION_ID="11"
VERSION="11 (bullseye)"
VERSION_CODENAME=bullseye
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

$ cd /lib/firmware/rtl_bt
$ ls -l *8192* *8812*
-rw-r--r-- 1 root root 38K Jul 26  2021 rtl8192ee_fw.bin
-rw-r--r-- 1 root root 38K Jul 26  2021 rtl8192eu_fw.bin
-rw-r--r-- 1 root root 40K Jul 26  2021 rtl8812ae_fw.bin

$ cd ../rtlwifi/
$ ls -l rtl8192eu* rtl8723bu* rtl8723bs_bt* rtl8723defw* rtl8822befw*
-rw-r--r-- 1 root root  25K Jul 26  2021 rtl8192eu_ap_wowlan.bin
-rw-r--r-- 1 root root  32K May 21 09:43 rtl8192eu_nic.bin
-rw-r--r-- 1 root root  26K Jul 26  2021 rtl8192eu_wowlan.bin
-rw-r--r-- 1 root root 9.0K Jul 26  2021 rtl8723bs_bt.bin
-rw-r--r-- 1 root root  21K Jul 26  2021 rtl8723bu_ap_wowlan.bin
-rw-r--r-- 1 root root  32K Jul 26  2021 rtl8723bu_nic.bin
-rw-r--r-- 1 root root  26K Jul 26  2021 rtl8723bu_wowlan.bin
-rw-r--r-- 1 root root  28K Jul 26  2021 rtl8723defw.bin
-rw-r--r-- 1 root root 125K Jul 26  2021 rtl8822befw.bin

=======================================================================

$ cat /etc/*-release
Fedora release 40 (Forty)
NAME="Fedora Linux"
VERSION="40 (Workstation Edition)"
ID=fedora
VERSION_ID=40
VERSION_CODENAME=""
PLATFORM_ID="platform:f40"
PRETTY_NAME="Fedora Linux 40 (Workstation Edition)"
ANSI_COLOR="0;38;2;60;110;180"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:fedoraproject:fedora:40"
DEFAULT_HOSTNAME="fedora"
HOME_URL="https://fedoraproject.org/"
DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f40/system-administrators-guide/"
SUPPORT_URL="https://ask.fedoraproject.org/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=40
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=40
SUPPORT_END=2025-05-13
VARIANT="Workstation Edition"
VARIANT_ID=workstation
Fedora release 40 (Forty)
Fedora release 40 (Forty)

$ cd /lib/firmware/rtl_bt
$ ls -l *8192* *8812*
-rw-r--r--. 1 root root 16868 Mar 11  2024 rtl8192ee_fw.bin.xz
-rw-r--r--. 1 root root 16732 Mar 11  2024 rtl8192eu_fw.bin.xz
-rw-r--r--. 1 root root 17456 Mar 11  2024 rtl8812ae_fw.bin.xz

$ cd ../rtlwifi/
$ ls -l rtl8192eu* rtl8723bu* rtl8723bs_bt* rtl8723defw* rtl8822befw*
-rw-r--r--. 1 root root 12504 Mar 11  2024 rtl8192eu_ap_wowlan.bin.xz
-rw-r--r--. 1 root root 19216 Mar 11  2024 rtl8192eu_nic.bin.xz
-rw-r--r--. 1 root root 16784 Mar 11  2024 rtl8192eu_wowlan.bin.xz
-rw-r--r--. 1 root root  6172 Mar 11  2024 rtl8723bs_bt.bin.xz
-rw-r--r--. 1 root root 13192 Mar 11  2024 rtl8723bu_ap_wowlan.bin.xz
-rw-r--r--. 1 root root 19676 Mar 11  2024 rtl8723bu_nic.bin.xz
-rw-r--r--. 1 root root 15868 Mar 11  2024 rtl8723bu_wowlan.bin.xz
-rw-r--r--. 1 root root 16532 Mar 11  2024 rtl8723defw.bin.xz
-rw-r--r--. 1 root root 58544 Mar 11  2024 rtl8822befw.bin.xz

=======================================================================

$ cat /etc/*-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=24.04
DISTRIB_CODENAME=noble
DISTRIB_DESCRIPTION="Ubuntu 24.04.1 LTS"
PRETTY_NAME="Ubuntu 24.04.1 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.1 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=noble
LOGO=ubuntu-logo

$ cd /lib/firmware/rtl_bt
$ ls -l *8192* *8812*
-rw-r--r-- 1 root root 18344 Aug 27 16:13 rtl8192ee_fw.bin.zst
-rw-r--r-- 1 root root 18186 Aug 27 16:13 rtl8192eu_fw.bin.zst
-rw-r--r-- 1 root root 19020 Aug 27 16:13 rtl8812ae_fw.bin.zst

$ cd ../rtlwifi/
$ ls -l rtl8192eu* rtl8723bu* rtl8723bs_bt* rtl8723defw* rtl8822befw*
-rw-r--r-- 1 root root 13131 Aug 27 16:13 rtl8192eu_ap_wowlan.bin.zst
-rw-r--r-- 1 root root 20040 Aug 27 16:13 rtl8192eu_nic.bin.zst
-rw-r--r-- 1 root root 17467 Aug 27 16:13 rtl8192eu_wowlan.bin.zst
-rw-r--r-- 1 root root  6443 Aug 27 16:13 rtl8723bs_bt.bin.zst
-rw-r--r-- 1 root root 13662 Aug 27 16:13 rtl8723bu_ap_wowlan.bin.zst
-rw-r--r-- 1 root root 20448 Aug 27 16:13 rtl8723bu_nic.bin.zst
-rw-r--r-- 1 root root 16481 Aug 27 16:13 rtl8723bu_wowlan.bin.zst
-rw-r--r-- 1 root root 17272 Aug 27 16:13 rtl8723defw.bin.zst
-rw-r--r-- 1 root root 64716 Aug 27 16:13 rtl8822befw.bin.zst

=======================================================================

$ cat /etc/*-release
DISTRIB_ID=LinuxMint
DISTRIB_RELEASE=22
DISTRIB_CODENAME=wilma
DISTRIB_DESCRIPTION="Linux Mint 22 Wilma"
NAME="Linux Mint"
VERSION="22 (Wilma)"
ID=linuxmint
ID_LIKE="ubuntu debian"
PRETTY_NAME="Linux Mint 22"
VERSION_ID="22"
HOME_URL="https://www.linuxmint.com/"
SUPPORT_URL="https://forums.linuxmint.com/"
BUG_REPORT_URL="http://linuxmint-troubleshooting-guide.readthedocs.io/en/latest/"
PRIVACY_POLICY_URL="https://www.linuxmint.com/"
VERSION_CODENAME=wilma
UBUNTU_CODENAME=noble
cat: /etc/upstream-release: Is a directory

$ cd /lib/firmware/rtl_bt
$ ls -l *8192* *8812*
-rw-r--r-- 1 root root 18344 May  6 08:17 rtl8192ee_fw.bin.zst
-rw-r--r-- 1 root root 18186 May  6 08:17 rtl8192eu_fw.bin.zst
-rw-r--r-- 1 root root 19020 May  6 08:17 rtl8812ae_fw.bin.zst

$ cd ../rtlwifi/
$ ls -l rtl8192eu* rtl8723bu* rtl8723bs_bt* rtl8723defw* rtl8822befw*
-rw-r--r-- 1 root root 13131 May  6 08:17 rtl8192eu_ap_wowlan.bin.zst
-rw-r--r-- 1 root root 20040 May  6 08:17 rtl8192eu_nic.bin.zst
-rw-r--r-- 1 root root 17467 May  6 08:17 rtl8192eu_wowlan.bin.zst
-rw-r--r-- 1 root root  6443 May  6 08:17 rtl8723bs_bt.bin.zst
-rw-r--r-- 1 root root 13662 May  6 08:17 rtl8723bu_ap_wowlan.bin.zst
-rw-r--r-- 1 root root 20448 May  6 08:17 rtl8723bu_nic.bin.zst
-rw-r--r-- 1 root root 16481 May  6 08:17 rtl8723bu_wowlan.bin.zst
-rw-r--r-- 1 root root 17272 May  6 08:17 rtl8723defw.bin.zst
-rw-r--r-- 1 root root 64716 May  6 08:17 rtl8822befw.bin.zst

=======================================================================

$ cat /etc/*-release
NAME="openSUSE Tumbleweed"
# VERSION="20240716"
ID="opensuse-tumbleweed"
ID_LIKE="opensuse suse"
VERSION_ID="20240716"
PRETTY_NAME="openSUSE Tumbleweed"
ANSI_COLOR="0;32"
# CPE 2.3 format, boo#1217921
CPE_NAME="cpe:2.3:o:opensuse:tumbleweed:20240716:*:*:*:*:*:*:*"
#CPE 2.2 format
#CPE_NAME="cpe:/o:opensuse:tumbleweed:20240716"
BUG_REPORT_URL="https://bugzilla.opensuse.org"
SUPPORT_URL="https://bugs.opensuse.org"
HOME_URL="https://www.opensuse.org"
DOCUMENTATION_URL="https://en.opensuse.org/Portal:Tumbleweed"
LOGO="distributor-logo-Tumbleweed"

$ cd /lib/firmware/rtl_bt
$ ls -l *8192* *8812*
-rw-r--r-- 1 root root 38764 Jul 13 05:49 rtl8192ee_fw.bin
-rw-r--r-- 1 root root 37904 Jul 13 05:49 rtl8192eu_fw.bin
-rw-r--r-- 1 root root 40520 Jul 13 05:49 rtl8812ae_fw.bin

$ cd ../rtlwifi/
$ ls -l rtl8192eu* rtl8723bu* rtl8723bs_bt* rtl8723defw* rtl8822befw*
-rw-r--r-- 1 root root  25264 Jul 13 05:49 rtl8192eu_ap_wowlan.bin
-rw-r--r-- 1 root root  32286 Jul 13 05:49 rtl8192eu_nic.bin
-rw-r--r-- 1 root root  29008 Jul 13 05:49 rtl8192eu_wowlan.bin
-rw-r--r-- 1 root root   9120 Jul 13 05:49 rtl8723bs_bt.bin
-rw-r--r-- 1 root root  20886 Jul 13 05:49 rtl8723bu_ap_wowlan.bin
-rw-r--r-- 1 root root  32108 Jul 13 05:49 rtl8723bu_nic.bin
-rw-r--r-- 1 root root  26398 Jul 13 05:49 rtl8723bu_wowlan.bin
-rw-r--r-- 1 root root  27726 Jul 13 05:49 rtl8723defw.bin
-rw-r--r-- 1 root root 127496 Jul 13 05:49 rtl8822befw.bin

===================================================================

> By the way, I found some firmware aren't added to MODULE_FIRMWARE():
> 
> rtlwifi/rtl8723ae/sw.c:         fw_name = "rtlwifi/rtl8723fw_B.bin";
> rtlwifi/rtl8821ae/sw.c:         wowlan_fw_name = "rtlwifi/rtl8812aefw_wowlan.bin";
> rtlwifi/rtl8821ae/sw.c:         wowlan_fw_name = "rtlwifi/rtl8821aefw_wowlan.bin";
> ...
> 
> I will prepare a patch for them. 

