Return-Path: <SRS0=xh+X=3Y=tuxedocomputers.com=wse@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD93CAC58E
	for <linux-firmware@archiver.kernel.org>; Sat, 13 Sep 2025 06:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2E20C4CEF7; Sat, 13 Sep 2025 06:46:03 +0000 (UTC)
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8221EC4CEEB;
	Sat, 13 Sep 2025 06:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8221EC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.27] (p5de4594b.dip0.t-ipconnect.de [93.228.89.75])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C5C162FC004A;
	Sat, 13 Sep 2025 08:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1757745951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNMf/ahLECRZIKJuhpoV7lnEWhzcySOxUpxMiOOv3sE=;
	b=qPvn4014UQX7XzFmjHsxW/KBd+FOMusy75Y8ijWnRz6hTTLo9h08zKEpCC67rfxHHmqcyC
	IPt92kYCZH5OtXqenLVLwTVMgj42tCwtLOdDarDIhpNZ8AV5L5/YFKNQML9DqXq9W2Dzfo
	iHvPgUXdWGmU2Xgn5N3CZM5/9mhVomc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <6b307db7-63e7-4911-9c93-bf9a68526538@tuxedocomputers.com>
Date: Sat, 13 Sep 2025 08:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Upstream ACPI fixes
List-Id: <linux-firmware.lore.kernel.org>
To: "Mario Limonciello (kernel.org)" <superm1@kernel.org>,
 linux-firmware@kernel.org
References: <5277e61e-3096-477e-b993-bd955be3306e@tuxedocomputers.com>
 <03975d9d-b9a7-47bb-83cf-6533c18a0402@kernel.org>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <03975d9d-b9a7-47bb-83cf-6533c18a0402@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 12.09.25 um 18:12 schrieb Mario Limonciello (kernel.org):
> On 9/9/2025 9:31 AM, Werner Sembach wrote:
>> Hi,
>>
>> is there a way to upstream fixed dsdt and ssdt ACPI tables?
>>
>> Best regards
>>
>> Werner
>>
>>
>
> The linux-firmware repository is specifically for binaries that are 
> loaded by kernel drivers in the mainline kernel.
>
> What do you mean upstream DSDT and SSDT ACPI tables?  Where?  What 
> would load them?  How would you match them to a machine?

Creating an initramfs with an aml file in /kernel/firmware/acpi does 
automatically load it (at least for Ubuntu) see here 
https://github.com/tuxedocomputers/tuxedo-corefix-clevo-nh5xax. Machine 
mating could be made while creating the initramfs (albeit it then would 
be a specialized initramfs file for that machine only).

That path is what lead me to ask on this mailing list. I'm sorry if it 
was the wrong one.

>
> The best place to distribute updated DSDT and SSDT tables is from a 
> BIOS update.  There is already linux infrastructure (fwupd / LVFS) 
> that can get an updated BIOS binary to the correct machines.
>
The ODM back in the day refused to fix it and now that it is an even old 
device it's even less likely.

My train of thought was: "Since there are more old Notebooks with ACPI 
issues, there could be a collection of fixes somewhere?"

Best regards,

Werner

