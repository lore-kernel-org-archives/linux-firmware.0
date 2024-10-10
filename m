Return-Path: <superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B66BD24447
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 19:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE62CC4CECC; Thu, 10 Oct 2024 19:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55123C4CED1;
	Thu, 10 Oct 2024 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728589762;
	bh=EvLeBgZqSdppgGWJOm+U6sHub4tcGfNP2VkxbwW+b8k=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=GeTLWaz55bN+ndvsVL+7SiJIjL3M8LpPPLz+IYOz46nT+7TyaV4U7lG+2vgYNO6UM
	 hga0omG1g5KqfIPxQEWNjsaRuY9WNnFNyV/5fF9K8f6vBdCsW7LiCKlwHmD+E5z/H8
	 UYdknafcF9eYlu/AFSQbbwD6gvL1TXnMq9IGWeQ7qaV+pMd+Sl6a3OD8TnsGx4NuI2
	 JzREHH260TKERFPxziYJQjlROlD14WGT3PJAKldWVLTbP7L+dqEhrIKHqTmnKCtBQN
	 WdU718OEqb3L1iMf02/bD2UMMyexkc8ucDp+W93g/AIonueqDdp63PSiS3o5anE4Oy
	 /Kh6Oe6OdyRYQ==
Message-ID: <d5d6f0fd-ff53-4168-a00f-e6f9308aac5e@kernel.org>
Date: Thu, 10 Oct 2024 14:49:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l41: Add firmware for Cirrus
 CS35L41 for some HP laptops
List-Id: <linux-firmware.lore.kernel.org>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>, linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
References: <d7909fe6-6f06-4e82-8c27-28bdcc912171@opensource.cirrus.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <d7909fe6-6f06-4e82-8c27-28bdcc912171@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/9/2024 10:21, Vitaly Rodionov wrote:
> 
> Hi,
> 
> We’d like to add the firmware for the Cirrus CS35L41 smart amplifiers on 
> a couple of HP laptop.
> Thanks,
> Vitaly
> 
> The following changes since commit 
> 919f79f9fb5536c1928a15ac82a2e53183b213cf:
> 
>    Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)
> 
> are available in the Git repository at:
> 
>    origin/cs35l41_snowwhite

This doesn't seem to be a valid Git repo.  Although we can take stuff 
from the mailing list, the Gitlab flow is a lot easier to fix problems.
If possible would you mind opening a MR instead at Gitlab [1].

[1] https://gitlab.com/kernel-firmware/linux-firmware

Thanks!

> 
> for you to fetch changes up to 72884e091e2e1a0842b5c11572aa4187de0b1d33:
> 
>    linux-firmware: Add firmware for Cirrus CS35L41 (2024-10-09 16:08:14 
> +0100)
> 
> ----------------------------------------------------------------
> Vitaly Rodionov (1):
>        linux-firmware: Add firmware for Cirrus CS35L41
> 
>   WHENCE                                              |  10 ++++++++++
>   cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin | Bin 0 -> 4080 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin | Bin 0 -> 4088 bytes
>   3 files changed, 10 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8cdf-spkid1-l0.bin
> 

