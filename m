Return-Path: <SRS0=+I4X=BP=gmail.com=sztsian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D472C433DF
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Aug 2020 14:04:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 507782312F; Wed,  5 Aug 2020 14:04:14 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E442312D
	for <linux-firmware@kernel.org>; Wed,  5 Aug 2020 14:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VI/55Q/T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E442312D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=sztsian@gmail.com
Received: by mail-pf1-f182.google.com with SMTP id z188so14918873pfc.6
        for <linux-firmware@kernel.org>; Wed, 05 Aug 2020 07:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RNly9URkvppFg5qdnnhfaYW5RWJjyZw6EPG4HdMAKyI=;
        b=VI/55Q/TRflZNPFtRBaFsqX6zNYtCP3K66Ex9Y+XJm59aJNmWIR4tPePzd8Odp+ZZN
         H0bIpOej4hfPJgh5LsXiHlfDbmBc1e8RF8Mo71hwuWiRhKwjttYHbqnlPos0i5rRaytD
         H11+b2P/+M/62RPGjY6NrIuAgmtImRlcyloU8lI/n6Xu+t1kTCXJPT4VIShrJDRLVe1W
         D6a4JXoLFjx2ECAwGwvuFYYZMx5GWMwaODu2wNKzLLUMp0zUS8uqqqMfW7ZvuR4MLiGk
         W3ZVhb2d21PHqissOBqBPVzKcsRIjwOHegsc2ZziK3cZzKOHJluPL5wO/1d9COgXLaKv
         puxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RNly9URkvppFg5qdnnhfaYW5RWJjyZw6EPG4HdMAKyI=;
        b=S16JfTjQoMQi4CjahKlJa8EgAcVew/Nlcv5zuImWckeaj1+2d8X04RkfV38Ud8aPXY
         AtFM+neRdeoJMVYTVepXDRlgKtCx3t1FZ5EgZ1fGrKzKgtp+pjEW2lddWq5QW8ESv8+o
         PAN1d2tLZSFrdyeCZSPBXDBjxxnOhLGeEqUjVWOSwkYuwyejY5DosC5UK+A1Q5tVhsOT
         KyY4IByFQqyPzQNmbqMGpbAjc8/fOfaqZWFu7/wi55W82PmbXbESahQgzmZ8hx1zQPq+
         852BrxqKM+V6t/SPvLL5B3zWZcmx59mGIVVNmL9lXznO9NGp7Fu2ZPsG8iGc3yyddsOb
         Y9pw==
X-Gm-Message-State: AOAM532+lsY3M1K7Kho/Y7l7hwYqiL14X9v0FXmNGqxi+tjrw6xEBkk1
	vMDIDyP2sA2KZBUe21tbHtgMnIao4RM=
X-Google-Smtp-Source: ABdhPJwnxC0p6Zm30uw1bt4Fi/nkc061NlTxCXFgljthcITq+qq2eq6I87seLuhnVUsA1CmrokPKjQ==
X-Received: by 2002:a62:18cc:: with SMTP id 195mr3546809pfy.174.1596636252883;
        Wed, 05 Aug 2020 07:04:12 -0700 (PDT)
Received: from i7.zsun.org (h150-66-46-238.ablenetvps.ne.jp. [150.66.46.238])
        by smtp.gmail.com with ESMTPSA id y20sm3755084pfn.183.2020.08.05.07.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 07:04:12 -0700 (PDT)
From: Zamir SUN <sztsian@gmail.com>
Subject: Re: Question about rtl8761b Realtek bluetooth dongle firmware
To: Jeremy MJ <jskier@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <CACEdYO2pyeEsLayHVEfKLR_5c-LETdiGndAmd-i0eO3ocx4ueg@mail.gmail.com>
Message-ID: <94824444-a48a-cbc8-1bb5-4c25df03f9ab@gmail.com>
Date: Wed, 5 Aug 2020 22:04:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACEdYO2pyeEsLayHVEfKLR_5c-LETdiGndAmd-i0eO3ocx4ueg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/4/20 10:14 PM, Jeremy MJ wrote:
> Hi,
> 
> I have reached out to realtek to inquire about licensing and
> permissibility of inclusion of the firmware to linux-firmware, will
> update if / when I hear back.
> 

Hi Jeremy,

Thanks for the reply. Just fyi, I've ever send email to the latest 
Realtek btrtl submitter of linux-firmware (hildawu@), but I did not get 
any reply till now.

I can share where the firmware stays in the Windows driver, but I'm 
reluctant because I don't know if it is proper to share it publicly. 
Getting confirmation from the Realtek engineers is definitely preferred.

> This came up with another user on the Mint forums, who has a specific
> brand using this chipset which provides beta Linux drivers and
> firmware:
> https://forums.linuxmint.com/viewtopic.php?f=49&t=319260&e=1
> 

Well, I cannot read the thread. Looks like account needed and register 
requires a really complex password.. That said, I will try again to read 
it later.

> I have tested both the driver and the firmware in linux 5.8; both
> appear to mostly work (a couple of unexpected event for opcode errors
> with the bluetooth module when using the firmware).
> 

The driver itself got merged in kernel 5.8. And to be a little verbose, 
I'm not sure if distribution packaging (rpm/deb etc.) will try to detect 
the firmware automatically so I did *not* add a MODULE_FIRMWARE line in 
the patch. That shouldn't affect the user as I can listen to music using 
the 5.8 kernel without any hack to the driver (if copying the firmware 
is not called a hack).

The only error I see is the "command 0x2038 tx timeout". And I do 
realize that there are compatible issues (the adapter + firmware can 
only pare with my newest headset, not the ones that I bought over 3 
years ago). Not sure if it is a driver issue or my userspace problems.

The config error is benign. This do not require a config binary.

[  544.152212] Bluetooth: hci0: RTL: examining hci_ver=0a hci_rev=000b 
lmp_ver=0a lmp_subver=8761
[  544.153186] Bluetooth: hci0: RTL: rom_version status=0 version=1
[  544.153190] Bluetooth: hci0: RTL: loading rtl_bt/rtl8761b_fw.bin
[  544.153337] Bluetooth: hci0: RTL: loading rtl_bt/rtl8761b_config.bin
[  544.153366] bluetooth hci0: Direct firmware load for 
rtl_bt/rtl8761b_config.bin failed with error -2
[  544.153372] Bluetooth: hci0: RTL: cfg_sz -2, total sz 18788
[  544.260240] Bluetooth: hci0: RTL: fw version 0xd898c37c
[  546.382558] Bluetooth: hci0: command 0x2038 tx timeout
[  595.434875] Bluetooth: hci0: Ignoring error of Inquiry Cancel command
[  844.482285] debugfs: File 'force_bredr_smp' in directory 'hci0' 
already present!
[  846.539979] Bluetooth: hci0: command 0x2038 tx timeout


> Thank you Zamir for your work on the initial device recognition issue.
> Would be nice to have broader support of bt5 dongles in Linux.
> 

Thanks again for bringing this up. And let's wish hardware vendors can 
do more good to Linux community in the future.

> Regards,
> 
> --
> Jeremy MountainJohnson
> jskier@gmail.com
> 
> ----
> From: Zamir SUN <sztsian@gmail.com>
> To: linux-firmware@kernel.org
> Cc: sztsian@gmail.com
> Subject: Question about rtl8761b Realtek bluetooth dongle firmware
> Date: Fri, 10 Apr 2020 23:44:49 +0800
> Message-ID: <4bb6d05c-b6b6-f8c8-3a49-f76cd129c665@gmail.com> (raw)
> 
> Hi,
> 
> Recently I purchased a unbranded USB Bluetooth dongle which is found not
> supported by Linux yet. And the vendor declare it to have rtl8716b chip.
> After playing with it for a while we've figured out that it's mostly
> compatible with the btrtl driver, with the difference firmware needed.
> We found the firmware from the Windows driver CD shipped along with the
> dongle and confirmed it works in Linux. I've carefully checked the
> Windows driver as well as the installer and did not see any EULA. As I
> don't work for Realtek, neither the producer of this USB dongle, so I am
> writing to ask if I can submit to linux-firmware?
> 
> The patch to the driver is already sent out
> https://patchwork.kernel.org/patch/11483367/
> 
> Thanks in advance.
> 

-- 
Zamir SUN
Fedora user
GPG : 1D86 6D4A 49CE 4BBD 72CF FCF5 D856 6E11 F2A0 525E
