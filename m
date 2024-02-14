Return-Path: <SRS0=KTEU=JX=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E5DC48BC4
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Feb 2024 08:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA79AC433C7; Wed, 14 Feb 2024 08:51:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8561FC433F1
	for <linux-firmware@kernel.org>; Wed, 14 Feb 2024 08:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8561FC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707900684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRX0q/HZgDQulgOR4jo4fsAX2q72IL+8j1ZhbkccY/w=;
	b=hGghNxw/IApdwjYP6eSG0BqRx8eZfURxFh+Fhq03OO7OIHrK9vkXp9kr7+Q+to7ziqmx6V
	oB2/HBmEur6yNFPYobWNf5IS+3t+CZF10ovM2nG2gMvk933khANvYhSqPSaMOH5W1dsfHM
	yNBahdHZcibb99sPLrjB7SPPtFDlX1Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-IpRZiE4XNdSFeoUNTB6KoQ-1; Wed, 14 Feb 2024 03:51:23 -0500
X-MC-Unique: IpRZiE4XNdSFeoUNTB6KoQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a3d06f4b70dso92324966b.0
        for <linux-firmware@kernel.org>; Wed, 14 Feb 2024 00:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707900682; x=1708505482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRX0q/HZgDQulgOR4jo4fsAX2q72IL+8j1ZhbkccY/w=;
        b=uRRhOPh0hz6IFi8hsQwu/IHKD90qzllbCmBCEMARh5e3FklQ+SVsZb6tKHcQh7DUpB
         gbY4zawKwyjI421cismUjoo2s1yH6G21MgbxMgR12Ln8voymsBq9ul02c/vrDQhe8tFA
         QjLraF6aTvmAlqgGWmwa5ZMRBcPvFi76cvebnswkiAOTju6oK1E/JxZ324jLf7ciXIHi
         TDU4u9SRo92aBwQnm2nIgzx/AW0lqPTZf3wx64wt16KdFQiIbhXIgsRXcnSSO7RwNZkP
         Fp8GlpTJzfU7TF0adGI8FQ/rJVxB0OIX4jwxhEA6oQSRQ1udogaKM6FwSII6TBp90eyw
         X8BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoqloP7vm6/iWW9sg1vvIYd2NcYY+GDg02L72DqAoYvSqr1jheF23LHvoGAnvIlz9WmZ6ztZXWCs0TSg3skvw3jTfLsd7rkofZ
X-Gm-Message-State: AOJu0YxozE29U2okjMp+u6sMTs0a+5oFLccf6KYOb0LyVemGnBP4cKq7
	BtrpizQerXRJ2JvuxIVP2iU7fANJATlfG1h0osb5qn5DjGVwN+iada5lPj+3lE/MUIHmm4qd7WR
	WeaETj7+G8+Ndqv05M/12JLHy8guQrCMntmX79tcmyG2xcKIQvJJGGa9EAw==
X-Received: by 2002:a17:907:20a2:b0:a38:882a:ad98 with SMTP id pw2-20020a17090720a200b00a38882aad98mr1507460ejb.24.1707900681968;
        Wed, 14 Feb 2024 00:51:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtecCD8bDtq3m3yyY21Nh4P8AxMfA9iXC3w11RbaMIKeP9xXymUi4gS333UcZA4Z2qa54V8w==
X-Received: by 2002:a17:907:20a2:b0:a38:882a:ad98 with SMTP id pw2-20020a17090720a200b00a38882aad98mr1507445ejb.24.1707900681540;
        Wed, 14 Feb 2024 00:51:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAuX2W0HPRi57exqaB8SPWfUGJhNjEgcANi/tly0BOGbiKDaflElrqvEif3GbsBas7YhCEPZ7QF+o7exstn+lTfa9X76DBVqoM
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ca23-20020a170906a3d700b00a3caccb8f66sm2095605ejb.44.2024.02.14.00.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 00:51:21 -0800 (PST)
Message-ID: <484e0f05-3332-4b97-89b7-74406677ed0f@redhat.com>
Date: Wed, 14 Feb 2024 09:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v2] Intel Image Processing Unit 6 firmware
List-Id: <linux-firmware.lore.kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-firmware@kernel.org
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>
References: <Zcx8i978Bx7QRSNJ@kekkonen.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zcx8i978Bx7QRSNJ@kekkonen.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/14/24 09:40, Sakari Ailus wrote:
> Hi folks,
> 
> This PR moves Intel IPU firmware files under ipu subdirectory for easier
> packaging. WHENCE is updated for IPU3 ImgU firmware links.
> 
> since v1:
> 
> - Rebase on the Gitlab repository main branch. The one in git.kernel.org
>   was not up to date. :-(
> 
> Please pull.

Just a quick note for the linux-firmware maintainers, no compat
symlinks are added for the ipu6 firmwares since the ipu6 driver
is not upstream yet. So we can just make the driver use the new
firmware paths before merging it upstream.

Regards,

Hans



> 
> 
> The following changes since commit 8acf0a98dbe1606cf696b0ee61bcce7eed5db80f:
> 
>   Merge branch 'robot/patch-10-1707787255' into 'main' (2024-02-13 01:31:56 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu6-2024-02-14-2
> 
> for you to fetch changes up to 08ab13d5d079c90dc21145710a2cc42326562aee:
> 
>   Intel IPU3 ImgU: Move firmware file under intel/ipu (2024-02-14 10:37:57 +0200)
> 
> ----------------------------------------------------------------
> Move IPU firmware under ipu
> 
> ----------------------------------------------------------------
> Sakari Ailus (2):
>       Intel IPU6: Move firmware binaries under ipu/
>       Intel IPU3 ImgU: Move firmware file under intel/ipu
> 
>  WHENCE                                                   |  15 ++++++++-------
>  intel/{ => ipu}/ipu6_fw.bin                              | Bin
>  intel/{ => ipu}/ipu6ep_fw.bin                            | Bin
>  intel/{ => ipu}/ipu6epadln_fw.bin                        | Bin
>  intel/{ => ipu}/ipu6epmtl_fw.bin                         | Bin
>  intel/{ => ipu}/ipu6se_fw.bin                            | Bin
>  .../irci_irci_ecr-master_20161208_0213_20170112_1500.bin | Bin
>  7 files changed, 8 insertions(+), 7 deletions(-)
>  rename intel/{ => ipu}/ipu6_fw.bin (100%)
>  rename intel/{ => ipu}/ipu6ep_fw.bin (100%)
>  rename intel/{ => ipu}/ipu6epadln_fw.bin (100%)
>  rename intel/{ => ipu}/ipu6epmtl_fw.bin (100%)
>  rename intel/{ => ipu}/ipu6se_fw.bin (100%)
>  rename intel/{ => ipu}/irci_irci_ecr-master_20161208_0213_20170112_1500.bin (100%)
> 

