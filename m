Return-Path: <lumag@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72542C282EC
	for <linux-firmware@archiver.kernel.org>; Tue, 11 Mar 2025 15:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4038CC4CEE9; Tue, 11 Mar 2025 15:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388D6C4CEEF;
	Tue, 11 Mar 2025 15:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741705421;
	bh=QPB1t0mySU4gHEq4MWlGGNUYvPypKLsj2WwOV9Rj4LE=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=HGqBa8WcefpJb0FPwpB+ZD2qNz4QWIC0DOyT/ikiaTCVhWL5T1YjkPyOW1vpBBWGO
	 PWaXeAfUFdkYqJkh6rQG3W+TZ1AS7ATXFz2y2RBOsV221R2WoG8qaBKJK7z9Y4Q5sT
	 3+Hk6G6+auql/rfNDaXuO6ntIoXQa9HLsl4wIwe96v6tFxlwqTOrHZqrIBuj5RTqd1
	 mvXTnrKwpYynnpblWwConAXf16MV9ce2sVko0XMitukF0jlFYbmJtZlrYeTqdnjY4U
	 QWfvS18cdpkG5nvvcsb9BgHoDNNpXd28OLbIOGRhhOjWHAlZXbaw47kcWcqNEc0Wz+
	 tKtm9G3D9iaYA==
Date: Tue, 11 Mar 2025 17:03:37 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RESEND] qcom: Update gpu firmwares for QCS8300 chipset
Message-ID: <ltok2u6ubjreqel7j4uuh3sxlixysjafdj5k4ncspem443rwiz@p4zdcdkmmwfd>
References: <3c83ecf5-2536-4fe5-bf01-08d6f9d12d82@quicinc.com>
 <fe88e76a-0f6a-4d21-b3b5-bf5d76b1f872@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe88e76a-0f6a-4d21-b3b5-bf5d76b1f872@quicinc.com>

On Tue, Mar 11, 2025 at 03:01:31AM +0530, Akhil P Oommen wrote:
> Hi,
> 
> Add/update the gpu firmwares required for Qualcomm's QCS8300 chipset.

Nice!

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>


> 
> -Akhil
> 
> ---
> The following changes since commit 11c4e60f95736ebd7fd98be5f54287d204c71bfd:
> 
>   Merge branch 'amd-staging' into 'main' (2025-03-10 17:46:53 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS8300
> 
> for you to fetch changes up to fe52903ce2a8c3be254b34b20b9dae76aadf19d8:
> 
>   qcom: Update gpu firmwares for qcs8300 chipset (2025-03-11 02:39:02 +0530)
> 
> ----------------------------------------------------------------
> Rajesh Kemisetti (1):
>       qcom: Update gpu firmwares for qcs8300 chipset
> 
>  WHENCE                    |   2 ++
>  qcom/a623_gmu.bin         | Bin 0 -> 51544 bytes
>  qcom/a650_sqe.fw          | Bin 31804 -> 31964 bytes
>  qcom/qcs8300/a623_zap.mbn | Bin 0 -> 1054364 bytes
>  4 files changed, 2 insertions(+)
>  create mode 100644 qcom/a623_gmu.bin
>  create mode 100644 qcom/qcs8300/a623_zap.mbn

-- 
With best wishes
Dmitry
