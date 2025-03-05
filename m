Return-Path: <superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F032C19F32
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Mar 2025 19:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32E63C4CEE0; Wed,  5 Mar 2025 19:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8505FC4CEE8;
	Wed,  5 Mar 2025 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741202054;
	bh=wwAIRWc/K39pEuu0mxli/AzszmX11DXv+hBPEYpLGGM=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=HziO/vbUEBpT9OHOQRZ8z2qbGnL8BlIS8OZHA9HdIkUGDRQp4VWjIC+wbVDOzV0A1
	 TFIB4zICgeRUN24TU7rMEZ0EPGMSWTby7rXal/3kR/Ks8lTS0jR3cQdqbSP9QhyW4G
	 xIbTir3GdA79WwCUMI0Ylvu/d4L3wSyqBNX4lfbC1Cn1v+B3q2nfoBtrKfR01kqTLG
	 bXddQVJU3vwS4FZXDlM/jMxIGqQCvmo6FMLZWHPHNNyhXK5nvG4BwGPK+ncyM4UzAz
	 hUk6sJ7PATyAir8jKOZLMc54VdsTQCCsu0hJsE9w/vh6V0E5ndS0NDVMWj3GOevh6O
	 N7PksTELKygMA==
Message-ID: <ada426b6-2c81-46ae-946c-d7b457e8522b@kernel.org>
Date: Wed, 5 Mar 2025 13:14:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for various ASUS laptops
List-Id: <linux-firmware.lore.kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>, linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
References: <1a7faf63-f11a-478b-96da-c6acba5f3f1b@opensource.cirrus.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <1a7faf63-f11a-478b-96da-c6acba5f3f1b@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/5/2025 11:13, Stefan Binding wrote:
> We would like to add firmware files to support Cirrus Logic Smart Amp CS35L41 for various ASUS laptops.
> 
> Thanks,
> 
> Stefan Binding
> 
> The following changes since commit a3e1417a176de3f1cda1c504d6d060ff990c914b:
> 
>    Merge branch 'robot/patch-0-1741163658' into 'main' (2025-03-05 12:42:06 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250305
> 
> for you to fetch changes up to 8fa4a471d210c5a5e3cc020d3f7477b6893b8dbd:
> 
>    cirrus: cs35l41: Add firmware and tuning for ASUS Consumer laptops (2025-03-05 17:11:29 +0000)
> 
> ----------------------------------------------------------------
> Stefan Binding (2):
>        cirrus: cs35l41: Add Firmware for various ASUS Commercial laptops
>        cirrus: cs35l41: Add firmware and tuning for ASUS Consumer laptops
> 
>   WHENCE                                              | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-l0.bin | Bin 0 -> 4908 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-r0.bin | Bin 0 -> 4908 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-l0.bin | Bin 0 -> 4908 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin | Bin 0 -> 4912 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-l0.bin | Bin 0 -> 4936 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-r0.bin | Bin 0 -> 4936 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-l0.bin | Bin 0 -> 4936 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-r0.bin | Bin 0 -> 4936 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431f63-l0.bin        | Bin 0 -> 3936 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431f63-r0.bin        | Bin 0 -> 3928 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin | Bin 0 -> 4432 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin | Bin 0 -> 4432 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin | Bin 0 -> 4432 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin | Bin 0 -> 4432 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin | Bin 0 -> 5220 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin | Bin 0 -> 5204 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin | Bin 0 -> 4904 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin | Bin 0 -> 4908 bytes
>   cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin | Bin 0 -> 4892 bytes
>   cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin | Bin 0 -> 4892 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin | Bin 0 -> 4908 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin | Bin 0 -> 4908 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin | Bin 0 -> 4908 bytes
>   cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin | Bin 0 -> 4908 bytes
>   25 files changed, 111 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431f63-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431f63-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin
> 
> 

Hello,

This has failed CI testing.  Please see here for details:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/466

Thanks,
