Return-Path: <superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7698ECAC5BE
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Sep 2025 15:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 448CEC116C6; Tue, 30 Sep 2025 15:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02B2C4CEF0;
	Tue, 30 Sep 2025 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759245413;
	bh=W/qmiyakn2clDMP6sEiLSh3l17BAb5Nl7AqMiAXOr+s=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=kfo1h5mVUBAEcHSMyWZKcUClxOgFRq0IgQK3rqyxtBWb/3RSNQgILz9aHZsQK2zT+
	 W7TkfiAaaZAruGyU1GQSUvxTPiLrmwVS+t3TsoFrTN5QyH76+0e0LwAUHFlmq9hRH4
	 4+J94n2bh3bmoilXachJ7m/fNVbztCvPw3PgR543UUp4i3RGC+L6SzfNM0V7xbn8Bm
	 jkXONoUAiLsLWfU7JJcN+WmIBLE90lXKoj3INuB/1caVwbX3k04tYahxn9AmYo6BV/
	 Jbss2LDI0v/RSgkgDHS4Ocd8gBj/PlDLnLwDlpLF7CB9LE8ShCz8VCxsIi/wmNLYRg
	 /NTiygaltWrWw==
Message-ID: <40b09ee1-d5e9-4b6c-ac76-dc048a845e0a@kernel.org>
Date: Tue, 30 Sep 2025 10:16:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
List-Id: <linux-firmware.lore.kernel.org>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>, linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <f3fdd6d5-5623-42aa-9342-ecec31c64a9c@oss.qualcomm.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <f3fdd6d5-5623-42aa-9342-ecec31c64a9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/30/2025 3:52 AM, Venkata Kota wrote:
> The following changes since commit 
> 2725800a9b5c532fcd1bc6c1502cb4678463416d:
> 
>    Merge branch 'main' into 'main' (2025-09-29 11:56:44 +0000)
> 
> are available in the Git repository at:
> 
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp- 
> fw-qcs8300-dspmon-163
> 
> for you to fetch changes up to 75aab120d4551fb1beaa54444003c6d538f97183:
> 
>    qcom: Update DSP firmware for qcs8300 platform. Update adsp, cdsp0 
> and gpdsp0 firmware for Qualcomm QCS8300 Platform. (2025-09-30 12:04:52 
> +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: Update DSP firmware for qcs8300 platform. Update adsp, 
> cdsp0 and gpdsp0 firmware for Qualcomm QCS8300 Platform.
> 
>   WHENCE                  |   6 +++---
>   qcom/qcs8300/adsp.mbn   | Bin 6684672 -> 6692864 bytes
>   qcom/qcs8300/cdsp0.mbn  | Bin 3080192 -> 3096576 bytes
>   qcom/qcs8300/gpdsp0.mbn | Bin 5873664 -> 5881856 bytes
>   4 files changed, 3 insertions(+), 3 deletions(-)
> 

CI failed, please fix and resubmit.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/712

I strongly suggest you add local checks to your workflow before 
submitting PRs.
