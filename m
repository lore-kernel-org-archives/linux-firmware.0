Return-Path: <SRS0=8y62=R4=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E6EE6F086
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Nov 2024 20:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED82FC4CECD; Fri,  1 Nov 2024 20:17:41 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D74A4C4CED1
	for <linux-firmware@kernel.org>; Fri,  1 Nov 2024 20:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D74A4C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso2494629e87.2
        for <linux-firmware@kernel.org>; Fri, 01 Nov 2024 13:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730492259; x=1731097059; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lcoPj7EK21drn+DggNeFn19BM+dhPn0Kdlqk/uydzdo=;
        b=w9b7kZRAe3RwbnacTxjnKFam3buR4po8sURbh7FJ8e0DGNnYWdWJ9LQkOPpfNMIHo5
         GKT287xj8nPgdQVcgN5p3So0Piz2RTIzK3Fn5HnVatMwXwUjc7XusIEiK1QpJ2phIut4
         08CXatYqbwPiqy1BxfAt2aPR2Bfb/VWpwdQ8+vnisUbOgRN2MMPEDVw6Dv7RvgM7h1fh
         wuPoix34b6JtO8LxbU2T8IWsVIG8h5ZetoYrREztxzfUicbIwoBZ+Zgk7Sl60TIztCP1
         ekXhKMatL/2xX233fVTe+Ecue6VrNgujvdb/mnNBANeabTi0ZuzqSQXtt3/Ah3GkW08u
         zxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730492259; x=1731097059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcoPj7EK21drn+DggNeFn19BM+dhPn0Kdlqk/uydzdo=;
        b=jpMKOb/Nww8jeH1PCm/N3xCxCWkRvJQS5Ng30BJnvj42PwmwyFGTfCuPcryVO762qh
         2VunuiTW5EH0lH8ZxAOOe4ACSbiup/zJyq/15cuOL5UZ9zrFQ61X1Fk4dBNWbyDHAYDz
         TAVMDxxJrU7QwRh5aYiV8eoGXd86tsJckgnWYD5ZvoivdxHKtpPLCXu5UJejO0rh0SMS
         PMPvuXWqbANyXxj/yxNeMXcBsO0kazzUL86vgtP4Tysgn2CFHd4Y9Bb9OsP5ZSBj0yCH
         ge09glwzY0IXgrm79NcRmQ3H8bVTq7PboGZtU3xCvudW5x8HVj1bRKYMgb/dUR9LArqx
         9A8w==
X-Gm-Message-State: AOJu0YwXOFXRfsa/8Lm2tE4PkmSJ6EiAIC1FNT4ZkcbXC1Tlct9x/Jc/
	rugNVc8ccBl6BYD7gQmxqZZvRBP3ov1tKWhqDW5YPzU2U5ac+u2Nt5Yp/XjNEX0=
X-Google-Smtp-Source: AGHT+IFrp5w2AKuqFT526kErw/5r6nkhNRMrWoGgniUFMCNjyFBRWOnn96n7hxqvkIkta1dBgzuqAw==
X-Received: by 2002:a05:6512:2815:b0:536:a695:9429 with SMTP id 2adb3069b0e04-53d65dca9a5mr2929239e87.10.1730492258732;
        Fri, 01 Nov 2024 13:17:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde4985sm665257e87.295.2024.11.01.13.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 13:17:38 -0700 (PDT)
Date: Fri, 1 Nov 2024 22:17:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] qcom: Add link for QCS6490 GPU firmware
Message-ID: <ctvtlkh4t54wdtwcw3jnbyi7xwks534k5ksvjtv6pt2zrr72wn@h5k6vfk7bzqe>
References: <20241101-qcs6490-firmware-v1-1-9bdb81ee3b89@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101-qcs6490-firmware-v1-1-9bdb81ee3b89@quicinc.com>

On Fri, Nov 01, 2024 at 09:52:24PM +0530, Akhil P Oommen wrote:
> Create a symlink between qcom/qcm6490/a660_zap.mbn and
> qcom/qcs6490/a660_zap.mbn.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> To: linux-firmware@kernel.org
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/WHENCE b/WHENCE
> index ff5b05f4ed01..ea8c2fc70b1f 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6188,6 +6188,7 @@ File: qcom/sm8250/a650_zap.mbn
>  File: qcom/a660_gmu.bin
>  File: qcom/a660_sqe.fw
>  File: qcom/qcm6490/a660_zap.mbn
> +Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
>  File: qcom/a702_sqe.fw
>  File: qcom/leia_pfp_470.fw
>  File: qcom/leia_pm4_470.fw

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
