Return-Path: <SRS0=yZ4q=RO=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9A8D2FFEC
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Oct 2024 10:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48097C4CEC3; Fri, 18 Oct 2024 10:43:40 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4925AC4CEC7
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 10:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4925AC4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso21698031fa.0
        for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 03:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729248217; x=1729853017; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh1eYlhMdlnoFwFC/2nUnaCLxYkSIhJpM6fVrJb0Up0=;
        b=qsz+klXTYpet4QDSBUFhlb5l7pUEBgsPcXAJKxrm8TKfC0cO/fblQPs+Pg6OlxxtNd
         kkmBv3zPnD/rUhLLSpFwAg0JY+z5z1hEtE0CISHddBYA1MLHc0KnsQcMoiq8stT9cIT/
         PGcgtYPmBaRFlGQKBPfNW8tmYdCVY7Ge6YO+zInrAdvn8qeid+vaUFrR55+Ul3Zd8/Ul
         uzemgvSKXuhij+8dwgUwEUYX+deqhptSGhzYiGoYVfMzN57CIDHxkt8YmS1BPBHIx6wK
         3pDy0qAjkj2MU0VQgmkPePzKsIof58xGxDvyliaZRooLdP97/NnkjaRkQDCJZOprG0nK
         Q1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729248217; x=1729853017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh1eYlhMdlnoFwFC/2nUnaCLxYkSIhJpM6fVrJb0Up0=;
        b=MzHHRVS3YwDdsrhNYQtQjLY+DYC7rmaliIwtGl6sVPxEZiEBRwCBRIzlzDAfkmPbNO
         IQqvxWb5phKSKn/7+IFMriM9yqrKYUCDmb1Fp2g3hVoB0BM6qe9yWAp5Op6EPnNeUJvo
         2fE7CkjUUJVJ6YgKOjbczJhTF+3g5akoBL+GyWytzuReFk6DJOoB9l5YxIu+yzZlytFx
         du6xdbUD6uJHbfQze6LECm6CiPAHG8AsdbxwsWT3wPSSxPYGSsZOoYJ9R1SaysQufQTT
         s5UNzOVqZEJ1EZMrq89r9la1MYghYaWhCSoh4tqm6+1e8xtf/6ZGWlifMMUi/AJpU4kx
         laQA==
X-Gm-Message-State: AOJu0YwZ4UXqdIaAqRLryaKHb73ysWsA7fRvC2aE+0aHQm1HLY1j3HVh
	pQvt3nGKVUCPsNevvMqw57/GKLkjt8fxOB15ADAOQ1U676ztRzVe4UnGIVlKEfQ=
X-Google-Smtp-Source: AGHT+IHsCSGuQox3E7t8h7o/rNFfRz2VyOPN8VsW154PA4+1qBIHzGcxsEmEFtYLd3nwAGQDMblVQg==
X-Received: by 2002:a05:6512:4009:b0:539:88f7:d3c4 with SMTP id 2adb3069b0e04-53a154b0dfamr1544541e87.29.1729248217245;
        Fri, 18 Oct 2024 03:43:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211a8fsm183744e87.261.2024.10.18.03.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:43:36 -0700 (PDT)
Date: Fri, 18 Oct 2024 13:43:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Message-ID: <i4ihcid3ka67rhwziue5tblahs6bwaehazq74bd5y64ybs4ahv@l6ti4xqr3yq6>
References: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>

On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
> 
> Hello,
> 
> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
> 
>   Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> adsp-fw-x1e80100-crd

Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
Windows firmware has it in adspr.jsn.

> 
> for you to fetch changes up to e1ebc2c9b9956f4115853c9feb07c56957503418:
> 
>   qcom: Add Audio firmware for X1E80100 CRD/QCPs (2024-10-18 11:48:47 +0530)
> 
> ----------------------------------------------------------------
> Sibi Sankar (1):
>       qcom: Add Audio firmware for X1E80100 CRD/QCPs
> 
>  WHENCE                     |   7 +++++++
>  qcom/x1e80100/adsp.mbn     | Bin 0 -> 22235528 bytes
>  qcom/x1e80100/adsp_dtb.mbn | Bin 0 -> 73528 bytes
>  qcom/x1e80100/adspr.jsn    |  22 ++++++++++++++++++++++
>  qcom/x1e80100/adsps.jsn    |  22 ++++++++++++++++++++++
>  qcom/x1e80100/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>  qcom/x1e80100/battmgr.jsn  |  22 ++++++++++++++++++++++
>  7 files changed, 102 insertions(+)
>  create mode 100644 qcom/x1e80100/adsp.mbn
>  create mode 100644 qcom/x1e80100/adsp_dtb.mbn
>  create mode 100644 qcom/x1e80100/adspr.jsn
>  create mode 100644 qcom/x1e80100/adsps.jsn
>  create mode 100644 qcom/x1e80100/adspua.jsn
>  create mode 100644 qcom/x1e80100/battmgr.jsn
> 
> Thanks,
> Sibi Sankar

-- 
With best wishes
Dmitry
