Return-Path: <SRS0=mUS3=U4=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1E4C02192
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Feb 2025 17:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2EA7FC4CEE4; Wed,  5 Feb 2025 17:38:56 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D994C4CED1
	for <linux-firmware@kernel.org>; Wed,  5 Feb 2025 17:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D994C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53f757134cdso2162e87.2
        for <linux-firmware@kernel.org>; Wed, 05 Feb 2025 09:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738777132; x=1739381932; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sTE79ZrbAVmZWk9h3zORtP5d1KbAIHAlUcc8kRpbIk=;
        b=wydjTIuSP9U5/mFai52/SoEnjrtTeIb4wIEPovEd62K+f1x8ADWwqocm7rE2b2N90Z
         FS12f51ryT2+P9LxPSDUnky1NYvf7DeyNVystbdiY0y0iNPtlqVLd6YXDt3E2JlXwxyZ
         RJBLy2j/1VRNFjK5DDawTRiplo1JjXnU/+XKE6Z2o+dKH7+TyiMC7r8zYXcCJFcPjvAJ
         HvvKalucsAYc/a2ynIvKXe7JM0mfv5BDzPnskVraNIAPZBsSlRRrYzmkrEiXQKEs3E9I
         TPM12A0J4Bkj6whntAE5F/9pInY0tPJqpcYCg8LGB5c02gHky+aSfgsxkAqmxqPn0F8Z
         roOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738777132; x=1739381932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sTE79ZrbAVmZWk9h3zORtP5d1KbAIHAlUcc8kRpbIk=;
        b=cWx2s7LVRPUTtMANLCTI9PEfhQvCW6MKITSF/Sdv5E+IL/SzjXk7BTwI0CB92LcxYX
         CQzXIRlVmyvGnnVK+2fUy8yORSKz9yFo9a4ZIPZYR6jLd+7sIiC3YHiwrGXqHDxR4Sva
         KzToU1HrbuYesO+CCkoZWYQ1BvvPbKlLOfyQYR1RDLc8oVBbPSXYb8MP66fPx+vNMHV6
         GkxD3B4B1GuRMW7ntS3Knk0WdgiB1uaU2j496C5i6TKazBMi5fa+VM6/HbEp7X4TFB2j
         b6h977RVxdsNSKpFB1cBtBFoKmIIEDLzcRaeyxwdYa+U7CGOkPMdPYvA5Yl2cxt/2SV1
         /ZMA==
X-Gm-Message-State: AOJu0Yzrs3q/HWv2pz1wemnxSY1JULfY6qZ972iQFGNi0pS1drqjn+dB
	SD39NYfIA3hJ3YVgeBa+cEqSwk1b+1lLH0e67qWRGj/t+nTb3yenn99ZwEjX4tSMtS/supnJKL8
	Gzoo=
X-Gm-Gg: ASbGncs5iTxY4GZb0FUHjUkja2zh6OYJaDRgdE2wF0PwRvTD/QWg8eOCr9bCPl/7N0j
	dYn9Srji4OJo/AJNXTVW91A6bMJVYcBd7ZqD4UvBwX9gu8RlhGYiMlADAaeAspsAsBnm0X8rxWJ
	JoPRIH0Tgq4l4qV5nRt2TUzMsii0Z0OA9adGbTMo7iys5/l94k9JV2JXDoHslP1Fof61tVMdoCg
	f0j5jz8meZcvvYTxEuCF7esBmFv07OXyDHlHCIISUnDBX0caOnmb7ZN/lMcDq1eJ32qw3cWtH5y
	tMn8CwsVJLsQG+YDE2UM8Er0+cCul48H9AoOekibKdg0PzanbTJJ4Kv6kQDxFs1MeabM3ko=
X-Google-Smtp-Source: AGHT+IETBVaXE6/Hg/OAT2lyPqdN8RSfx4v6Dzg3uyMndgNxU8DF8p1w15OIVOZl+cK1Wc6eHyojOg==
X-Received: by 2002:a05:6512:2398:b0:540:1e17:10eb with SMTP id 2adb3069b0e04-54405a71ddamr1396452e87.48.1738777131942;
        Wed, 05 Feb 2025 09:38:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5440dab6676sm21872e87.100.2025.02.05.09.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:38:50 -0800 (PST)
Date: Wed, 5 Feb 2025 19:38:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, ath11k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: ath11k: add device-specific firmware for QCM6490 boards
Message-ID: <6l2temp4jz7laqvl4pgmo5hfdujzjar2ksrgdafkchul6mldv3@ygzwntmosahf>
References: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>

On Sat, Feb 01, 2025 at 06:20:52PM +0200, Dmitry Baryshkov wrote:
> Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
> NAK this.

Josh, having ack from both MSM and ath11k, I think this now can be
merged. Thank you Bjorn and Jeff!

> 
> Compatibility links are added to follow the names in the existing DTs for the
> QCM6490-IDP and Qualcomm RB3 Gen2. If platform maintainers think that breaking
> those is fine, I can drop those link.
> 
> The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83a7:
> 
>   Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> 
> for you to fetch changes up to f0e750f347227cb1e0008715a27b2020399b5efc:
> 
>   ath11k: add device-specific firmware for QCM6490 boards (2025-02-01 18:10:11 +0200)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       ath11k: add device-specific firmware for QCM6490 boards
> 
>  WHENCE                                |   7 +++++++
>  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn | Bin 0 -> 7734064 bytes
>  2 files changed, 7 insertions(+)
>  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn

-- 
With best wishes
Dmitry
