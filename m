Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2E9C54EE9
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Sep 2022 23:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 554C8C433B5; Thu,  8 Sep 2022 23:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE563C433D7;
	Thu,  8 Sep 2022 23:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662678878;
	bh=FaGZhpQ4KIIyQPnkRSt/yTyag+/kTbX0PlA2zKEKasc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=vJ0PSvpMUw/0iuvPsoRKJE3YMk4g77AEg0Fr/d9nrZmFMpPFi96nO2eFAmjvAAArA
	 +kS9k+B+xfuO3Z4AJq9OW332j4wKX5v7SD4JlSHE31YT8SQ055T3k7vRsxpMgb5/5x
	 lW6ZZ8Na6gSLijflTSMXBsTyI9U8tjcQjXK8XdhDDHs4nnltj/CVJeQ3+LY6e9sPfV
	 Z9XoZT5+62yCy8Fy653x2MplngLKaFZEU0unOkEyQOHdwQ1X1s9UWiM9SlVZRtkIDJ
	 DEl7ezhWYwgwmn2sAe3bWOBx7OBAQAfNid+k6LM703pAuby5hY8lLeCK4l4oKLIue0
	 nu/d/uTmlUKbA==
Date: Thu, 8 Sep 2022 18:14:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Mark Pearson <markpearson@lenovo.com>
Subject: Re: [PATCH] qcom: rename Lenovo ThinkPad X13s firmware paths
Message-ID: <20220908231435.bnqeajjyrq3twvm6@builder.lan>
References: <20220908143742.3362357-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908143742.3362357-1-dmitry.baryshkov@linaro.org>

On Thu, Sep 08, 2022 at 05:37:42PM +0300, Dmitry Baryshkov wrote:
> After some discussion with Bjorn, the Qualcomm platform maintainer, it
> was agreed to follow the established practice and to inject the SoC name
> into the firmware paths.
> 
> It is highly unlikely that we are going to run Linux off the existing
> ACPI data in these platforms anytime soon. And even if we do so, we'd
> have to figure out the file names anyway, as they do not follow the
> existing standard names.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Mark Pearson <markpearson@lenovo.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  WHENCE                                         |  17 +++++++++--------
>  qcom/{ => sc8280xp}/LENOVO/21BX/adspr.jsn      |   0
>  qcom/{ => sc8280xp}/LENOVO/21BX/adspua.jsn     |   0
>  qcom/{ => sc8280xp}/LENOVO/21BX/battmgr.jsn    |   0
>  qcom/{ => sc8280xp}/LENOVO/21BX/cdspr.jsn      |   0
>  qcom/{ => sc8280xp}/LENOVO/21BX/qcadsp8280.mbn | Bin
>  qcom/{ => sc8280xp}/LENOVO/21BX/qccdsp8280.mbn | Bin
>  .../LENOVO/21BX/qcdxkmsuc8280.mbn              | Bin
>  qcom/{ => sc8280xp}/LENOVO/21BX/qcslpi8280.mbn | Bin
>  9 files changed, 9 insertions(+), 8 deletions(-)
>  rename qcom/{ => sc8280xp}/LENOVO/21BX/adspr.jsn (100%)
>  rename qcom/{ => sc8280xp}/LENOVO/21BX/adspua.jsn (100%)
>  rename qcom/{ => sc8280xp}/LENOVO/21BX/battmgr.jsn (100%)
>  rename qcom/{ => sc8280xp}/LENOVO/21BX/cdspr.jsn (100%)
>  rename qcom/{ => sc8280xp}/LENOVO/21BX/qcadsp8280.mbn (100%)
>  rename qcom/{ => sc8280xp}/LENOVO/21BX/qccdsp8280.mbn (100%)
>  rename qcom/{ => sc8280xp}/LENOVO/21BX/qcdxkmsuc8280.mbn (100%)
>  rename qcom/{ => sc8280xp}/LENOVO/21BX/qcslpi8280.mbn (100%)
> 
> diff --git a/WHENCE b/WHENCE
> index f5aa93cd3726..f3f9a7a93cde 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5595,7 +5595,7 @@ File: qcom/a660_gmu.bin
>  File: qcom/a660_sqe.fw
>  File: qcom/leia_pfp_470.fw
>  File: qcom/leia_pm4_470.fw
> -File: qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
> +File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
>  
>  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
>  
> @@ -5622,13 +5622,14 @@ File: qcom/sm8250/adspr.jsn
>  File: qcom/sm8250/adspua.jsn
>  File: qcom/sm8250/cdsp.mbn
>  File: qcom/sm8250/cdspr.jsn
> -File: qcom/LENOVO/21BX/adspr.jsn
> -File: qcom/LENOVO/21BX/adspua.jsn
> -File: qcom/LENOVO/21BX/battmgr.jsn
> -File: qcom/LENOVO/21BX/cdspr.jsn
> -File: qcom/LENOVO/21BX/qcadsp8280.mbn
> -File: qcom/LENOVO/21BX/qccdsp8280.mbn
> -File: qcom/LENOVO/21BX/qcslpi8280.mbn
> +File: qcom/sc8280xp/LENOVO/21BX/adspr.jsn
> +File: qcom/sc8280xp/LENOVO/21BX/adspua.jsn
> +File: qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
> +File: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
> +File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
> +File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
> +File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
> +Link: qcom/LENOVO/21BX -> ../sc8280xp/LENOVO/21BX
>  
>  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
>  
> diff --git a/qcom/LENOVO/21BX/adspr.jsn b/qcom/sc8280xp/LENOVO/21BX/adspr.jsn
> similarity index 100%
> rename from qcom/LENOVO/21BX/adspr.jsn
> rename to qcom/sc8280xp/LENOVO/21BX/adspr.jsn
> diff --git a/qcom/LENOVO/21BX/adspua.jsn b/qcom/sc8280xp/LENOVO/21BX/adspua.jsn
> similarity index 100%
> rename from qcom/LENOVO/21BX/adspua.jsn
> rename to qcom/sc8280xp/LENOVO/21BX/adspua.jsn
> diff --git a/qcom/LENOVO/21BX/battmgr.jsn b/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
> similarity index 100%
> rename from qcom/LENOVO/21BX/battmgr.jsn
> rename to qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
> diff --git a/qcom/LENOVO/21BX/cdspr.jsn b/qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
> similarity index 100%
> rename from qcom/LENOVO/21BX/cdspr.jsn
> rename to qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
> diff --git a/qcom/LENOVO/21BX/qcadsp8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
> similarity index 100%
> rename from qcom/LENOVO/21BX/qcadsp8280.mbn
> rename to qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
> diff --git a/qcom/LENOVO/21BX/qccdsp8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
> similarity index 100%
> rename from qcom/LENOVO/21BX/qccdsp8280.mbn
> rename to qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
> diff --git a/qcom/LENOVO/21BX/qcdxkmsuc8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
> similarity index 100%
> rename from qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
> rename to qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
> diff --git a/qcom/LENOVO/21BX/qcslpi8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
> similarity index 100%
> rename from qcom/LENOVO/21BX/qcslpi8280.mbn
> rename to qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
> -- 
> 2.35.1
> 
