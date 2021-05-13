Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A1AC433ED
	for <linux-firmware@archiver.kernel.org>; Thu, 13 May 2021 06:09:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AF56B613E6; Thu, 13 May 2021 06:09:42 +0000 (UTC)
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25F5E613DE
	for <linux-firmware@kernel.org>; Thu, 13 May 2021 06:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25F5E613DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+a91e02.be9e4a-linux-firmware=kernel.org@mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620886182; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=DFG9qqEL80a90T6eOVH9GPe7NTWmMeB96ru+p2yxzCI=; b=kGowXarN4RiqlQ3AoQCG6ET7GtDrxC4QiXmG5BLfkO2iFvNtqz2SDlAUniYH+/EFgbV791PL
 Uo9lzd0MGPHm6g29kzA7vTJLA6iZuYP4mj6uBUffHBdJkwDeIROj7BSNACAJrchkEDdo6mjz
 02fcjuN88gNKticj4hOFj1CJVrQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 609cc280a4c86a394a491909 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 May 2021 06:09:04
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 7A156C4338A; Thu, 13 May 2021 06:09:04 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id AC824C433D3;
	Thu, 13 May 2021 06:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AC824C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Brian Norris <briannorris@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Pkshih <pkshih@realtek.com>,  "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: Request to update 8852a firmware of rtw89 to v0.13.8.0
References: <57e9f582340545c79a9ab3433e2a4a7d@realtek.com>
	<87cztx87tr.fsf@tynnyri.adurom.net>
	<CA+ASDXM9YmhMWmttkrCxB0_tf6Kf6Sz=7Yc26CmjZmMUxyxAfw@mail.gmail.com>
Date: Thu, 13 May 2021 09:09:00 +0300
In-Reply-To: <CA+ASDXM9YmhMWmttkrCxB0_tf6Kf6Sz=7Yc26CmjZmMUxyxAfw@mail.gmail.com>
	(Brian Norris's message of "Tue, 11 May 2021 12:10:55 -0700")
Message-ID: <87tun7i2rn.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <20210513060900.BqQ1p2enyhbsaHwCRE-5Pmcwcdlq21aYd0bQ6sgwIyM@z>

Brian Norris <briannorris@chromium.org> writes:

> On Tue, May 11, 2021 at 11:05 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Pkshih <pkshih@realtek.com> writes:
>>
>> > Please help to update 8852a firmware.
>> > This is first time I send a pull request. If anything is wrong,
>> > please let me know.
>>
>> rtw89 driver is not in upstream yet, and it has not been reviewed
>> either. I recommend holding off pulling the firmware until the driver is
>> reviewed.
>
> FWIW, preliminary rtw89 firmware was already merged. This is just an update.
>
> I also wonder, what's the harm? People like me are actively testing
> the early versions, and I've done a very barebones amount of review (I
> hope to do more). It really helps me to have up-to-date firmware
> published somewhere central -- I guess I can take GitHub instead, but
> again, why not kernel.org? If anyone else is looking at testing, they
> know where to get the pieces too, and we can compare results.

It can create confusion to the users if during review we make changes
how firmware files are handled. Some drivers have windows style .ini
files which are not ok in an upstream driver, there could be changes in
the file format etc.

But I have no strong opinion here, my main motivation is just to try to
keep things simple for maintaining the "interface" between
linux-firmware and kernel wireless drivers. My preference is that the
firmware files are ready for submission when a new driver is submitted
for review, but the firmware files are submitted only after the driver
is accepted.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
