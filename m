Return-Path: <SRS0=p+6g=75=debian.org=bage@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E668C7618D
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Apr 2023 12:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 336E1C433D2; Thu,  6 Apr 2023 12:30:47 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4532C433EF;
	Thu,  6 Apr 2023 12:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4532C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To
	:Cc:Content-ID:Content-Description;
	bh=Gupgq3oa/VQ+5W+sHJnEcoMpJGz4BhadG9u00ihzEzQ=; b=gN++HZBjYYEdOKL94HLTyj1u6A
	kMsxK/XI2hJK9fn01F769qQq6M18nORaoWyiNN3HjhpBaJAOvdvZMpkGeGj8rOAwXfz9iRw7GZku8
	7Vqldl1apmJD+Nu61fGH8wX3dzerCyrZXdGT1yd21dkCt223IdpznhkhFUtMqWHqGG+4yVOnB6uos
	Lld+gaGg0HWWqvo8ZYYI42hceMUxYkbBoIDQQV/uuZww50hjLv5WB3EbFkTv4+EUebffCTZCJJNFN
	HdzJ85Ud92AzM57c+VSU3+ZYYOWiBOjyVfpxllISlOTCbdPfIk657KPDP7T5mS6scego5Z7KDc2kx
	ddE9Cxqg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1pkOlA-00Brys-3o; Thu, 06 Apr 2023 12:30:36 +0000
Message-ID: <fc39ea5d-5be3-5462-e6cf-f50b1e70744c@debian.org>
Date: Thu, 6 Apr 2023 14:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/1] rtl_bt: Add firmware for the Bluetooth part of
 RTL8723CS
Content-Language: de-DE-frami
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
References: <20230320164448.3489-1-bage@debian.org>
From: Bastian Germann <bage@debian.org>
In-Reply-To: <20230320164448.3489-1-bage@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Debian-User: bage

Hi Josh,

Am 20.03.23 um 17:44 schrieb Bastian Germann:
> The btrtl support for RTL8723CS has entered bluetooth-next and so the
> firmware should be provided with linux-firmware.
> 
> Changelog:
> v2: Use file from realtek.com

Is a file from realtek.com (from an already imported package; see e6b9001e9111)
okay without someone from Realtek submitting it?

> Bastian Germann (1):
>    rtl_bt: Add firmware for the Bluetooth part of RTL8723CS
> 
>   WHENCE                     |   4 ++++
>   rtl_bt/rtl8723cs_xx_fw.bin | Bin 0 -> 19732 bytes
>   2 files changed, 4 insertions(+)
>   create mode 100644 rtl_bt/rtl8723cs_xx_fw.bin

Thanks,
Bastian
