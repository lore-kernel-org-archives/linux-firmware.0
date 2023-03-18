Return-Path: <SRS0=ig14=7K=leemhuis.info=regressions@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C45C61DA4
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Mar 2023 08:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69203C433D2; Sat, 18 Mar 2023 08:04:51 +0000 (UTC)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3A7BC433EF;
	Sat, 18 Mar 2023 08:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3A7BC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pdRYO-0003hE-Mv; Sat, 18 Mar 2023 09:04:40 +0100
Message-ID: <9a174e48-5cd6-535f-4f01-4e81398e772f@leemhuis.info>
Date: Sat, 18 Mar 2023 09:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [FIRMWARE] Regression on rtw89/rtw8852b_fw.bin by the latest
 update
Content-Language: en-US, de-DE
To: Takashi Iwai <tiwai@suse.de>, Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org,
 Josh Boyer <jwboyer@kernel.org>
References: <878rfuo67a.wl-tiwai@suse.de>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <878rfuo67a.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679126689;9c22f637;
X-HE-SMSGID: 1pdRYO-0003hE-Mv


On 18.03.23 08:43, Takashi Iwai wrote:
> 
> we've received a regression report on openSUSE Tumbleweed about the
> Realtek WiFi, and the culprit was spotted to be the latest firmware
> update of rtw89/rtw8852b_fw.bin.  The former working linux-firmware
> tree was at the commit 5c11a3742947, while broken at 5bc279fb161d.
> 
> The details are found in:
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1209449
> 
> Could you check the problem?
> (Or feel free to join to the bugzilla entry above.)

FWIW, I already CCed Josh on the following bug yesterday in a comment
where I suggested the updated firmware should be reverted:

https://bugzilla.kernel.org/show_bug.cgi?id=217207

But it's likely a good idea to write a normal mail, so thx for that!

FWIW, the issue is also discussed here:

https://lore.kernel.org/all/df1ce994-3368-a57e-7078-8bdcccf4a1fd@gmail.com/#t

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
