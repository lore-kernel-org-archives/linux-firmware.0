Return-Path: <SRS0=gD5U=CB=molgen.mpg.de=pmenzel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50E4D39406
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Apr 2026 10:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9126AC2BC9E; Thu,  2 Apr 2026 10:22:40 +0000 (UTC)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6416EC116C6;
	Thu,  2 Apr 2026 10:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6416EC116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3CFF84C2C37D5A;
	Thu, 02 Apr 2026 12:22:28 +0200 (CEST)
Message-ID: <42befa05-71bd-4a5e-9f8f-269ad532a234@molgen.mpg.de>
Date: Thu, 2 Apr 2026 12:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] rtl8822cu: BLE disconnects with firmware 0x0673_0EDC
To: Hilda Wu <hildawu@realtek.com>
References: <bug-221309-62941@https.bugzilla.kernel.org/>
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-bluetooth@vger.kernel.org, linux-firmware@kernel.org,
 Josh Boyer <jwboyer@kernel.org>, regressions@lists.linux.dev
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <bug-221309-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[To/Cc: +Hilda, linux-firmware@, Josh]

Dear Hilda, dear Josh,


Hilda, unfortunately, you do not have a Linux Kernel Bugzilla account, 
so I am replying here.

Am 02.04.26 um 01:57 schrieb bugzilla-daemon@kernel.org:
> https://bugzilla.kernel.org/show_bug.cgi?id=221309
> 
>              Bug ID: 221309
>             Summary: rtl8822cu: BLE disconnects with firmware 0x0673_0EDC
>                      regression
>             Product: Drivers
>             Version: 2.5
>            Hardware: AMD
>                  OS: Linux
>              Status: NEW
>            Severity: normal
>            Priority: P3
>           Component: Bluetooth
>            Assignee: linux-bluetooth@vger.kernel.org
>            Reporter: i+kernel.org@schimpf.link
>          Regression: No
> 
> Created attachment 309794
>    --> https://bugzilla.kernel.org/attachment.cgi?id=309794&action=edit
> stability log after downgrade
> 
> Overview
> 
> After updating linux-firmware-realtek to 20260221-1 (which includes commit fbf93476,
> "update rtl8822c bt usb and uart firmware to 0x0673"), the RTL8822CU USB Bluetooth adapter
> (0bda:b00c) begins dropping BLE connections every few minutes. Each disconnect
> lasts several seconds before the device reconnects. The adapter itself never resets and
> the USB device remains active throughout. Only the BLE link is lost.

[… Linux 6.19.10-arch1-1 …]

It looks like, the linux-firmware commit [1][2] caused a regression. 
(Also linux-bluetooth@ wasn’t in Cc?) Could you please look into it? I 
recommend to revert it for the time being and cut a new linux-firmware 
release.


Kind regards,

Paul


PS: Josh, do you have a pointer how to reach the commit from the merge 
request?

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/900 
shows 
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/1f806c75e479fea9f222579deb6e69d285b614fc, 
but I do not see a way to get to 
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/fbf93476.


[1]: 
https://lore.kernel.org/all/20260202115751.1056277-1-hildawu@realtek.com/
[2]: https://gitlab.com/kernel-firmware/linux-firmware/-/commit/fbf93476
