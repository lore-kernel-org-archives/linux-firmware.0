Return-Path: <SRS0=3xEa=BX=debian.org=bage@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D546EC7EE24
	for <linux-firmware@archiver.kernel.org>; Sat,  3 Jun 2023 14:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8ABBCC4339B; Sat,  3 Jun 2023 14:39:11 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A242C433D2
	for <linux-firmware@kernel.org>; Sat,  3 Jun 2023 14:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A242C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Subject:From:References:To:MIME-Version:Date:Message-ID:Reply-To
	:Cc:Content-ID:Content-Description;
	bh=WoVAMeuAZgCZzsSYfhln1yCysRVCecuzPgUDRjg1sb4=; b=Uz00o5mYeNn0sY1MXtN/i8WaqD
	gtsoBWGh84/930gupBUJdOcV+eSzuuBINahU6Iy2gtW65jcYHt+PnAodGbMHWCmztQpuoathRM8ZX
	XnreYXRZhp8693c1HmA29juS9If91ajzVwKyxgCjHxYNO5/6EXd/sTRyG3eH+N4TEydujR8RVys54
	DtyQ/lkv9C6wv8CrlUcLNTuDxwVkzgLrSoK4enExErZLitsFkiPIC3/weqolCjmjBWTPBDmKJmRWI
	1wLoYDuP8RuriJH4V80Lr+dxrgqqBJJELMCcKCyZ0YAi6tH62j8V24TX/pmpKRdgK6eKe/5XS8bol
	1IagocFQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1q5SPG-000rLZ-2s
	for linux-firmware@kernel.org; Sat, 03 Jun 2023 14:39:02 +0000
Message-ID: <51f71c81-b677-bf59-dac3-7a2d1633ec8e@debian.org>
Date: Sat, 3 Jun 2023 16:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
References: <20230320164448.3489-1-bage@debian.org>
Content-Language: de-DE-frami
From: Bastian Germann <bage@debian.org>
Subject: Re: [PATCH v2 0/1] rtl_bt: Add firmware for the Bluetooth part of
 RTL8723CS
In-Reply-To: <20230320164448.3489-1-bage@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Debian-User: bage

Am 20.03.23 um 17:44 schrieb Bastian Germann:
> The btrtl support for RTL8723CS has entered bluetooth-next and so the
> firmware should be provided with linux-firmware.

Friendly ping. The btrtl support for RTL8723CS is available with v6.4-rc1 and was backported to stable versions.
It would be nice to have this available.

> Changelog:
> v2: Use file from realtek.com
> 
> Bastian Germann (1):
>    rtl_bt: Add firmware for the Bluetooth part of RTL8723CS
> 
>   WHENCE                     |   4 ++++
>   rtl_bt/rtl8723cs_xx_fw.bin | Bin 0 -> 19732 bytes
>   2 files changed, 4 insertions(+)
>   create mode 100644 rtl_bt/rtl8723cs_xx_fw.bin

