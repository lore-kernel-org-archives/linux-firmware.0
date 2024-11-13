Return-Path: <SRS0=ZqBG=SI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8548FD41C02
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 05:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E9F8C4CECF; Wed, 13 Nov 2024 05:45:10 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C32AC4CECD
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 05:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C32AC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f84907caso7276341e87.3
        for <linux-firmware@kernel.org>; Tue, 12 Nov 2024 21:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731476707; x=1732081507; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFHqmb+AP2eWjFFb6aR3qfKpxL8s0S9/DWyECwqntas=;
        b=Y4glkobA1gwkutbOVb7xVloYiqop9oKCBci4nfIdDtoUU/pfp4JXy9b44lv4bZIS3/
         Qs+4yiNOjiELZwXlKkkL3iNDo92ZgL5YcIRMEsPGR9yScN74qB3Iq1j2ZrOnXOEQNspN
         075X9+O9i7svkvGV72d0nCzX9GXbAe5zW1NnlN8SqdHr5K9zsvS/sRSS0COeaVvUL99G
         lAZnuBQoFw8MePjqgnMYU3EhaEc7GpnviM2rQpH17y5qH7HYypRDuGnlZAehmgS03j4B
         WDqLZk2A+2vWhZlzCNVcBP4yPhVetBMxI/71u9+QICDv/tSN22b+KioYzQBuPCKgTYXu
         Nbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731476707; x=1732081507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFHqmb+AP2eWjFFb6aR3qfKpxL8s0S9/DWyECwqntas=;
        b=YV7CcfOA1rbm10DOGCxMLJsshpqeQovM0NWqEkR1fOTD98WmZbkyAGwN/JG3iGUuku
         MTJk/RHhSIYc12hCX+ytFVf9mnKSi1IbiNaih+kXlSdgkCAMoxXwEbgAxbGG6p//FPft
         YlhMnj91HxKeSY3Jx/Ju3SB4U+Vre1MwxIJPWr91bTfGw6fsXlKyjujVSMrR6d8Srs01
         nxFoO+tnnXAQpn2Tgn2bS/DHws4I6//GGQ2zQVJddn8AIpfMiGAMCFzpBvZ3aJoi/LN0
         nzjCgHp2BJ2l8rkvTDSKmwBE4m7kH87gtQST8uFaKDBEwTll/6GRM6COHts58UwnGJE8
         SiNQ==
X-Gm-Message-State: AOJu0YzlOniGDwapHMBn+1dj8L6Bytlpx2s91108mIi3Sp+S2aeRpsow
	cZXbuKLpmYQCy6J246TsTX0TGu3IJrJYiNDZ9FuB6bhFe7dQYjtmHVooKRn1gpuexCpanbFrAwr
	6
X-Google-Smtp-Source: AGHT+IEo9urzEejJYRO+QMhldHINPRIrfumJGeYCw1s7kAfNe0A4pQL6nQHzDcTitFWO+g37nqAKGQ==
X-Received: by 2002:a19:9118:0:b0:53d:a01f:d02b with SMTP id 2adb3069b0e04-53da01fd09bmr404787e87.3.1731476707517;
        Tue, 12 Nov 2024 21:45:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d82678558sm2083199e87.56.2024.11.12.21.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 21:45:06 -0800 (PST)
Date: Wed, 13 Nov 2024 07:45:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: update venus firmware file for SC7280
Message-ID: <25xjjmnyg55hs7mqnqtk6tae26lr2r33qfon6rfimnonqzoitv@3bcpd4ybqqtk>
References: <6353f092-9816-8221-1233-c423767320ac@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6353f092-9816-8221-1233-c423767320ac@quicinc.com>

On Wed, Nov 13, 2024 at 09:54:51AM +0530, Dikshita Agarwal wrote:
> Hello,
> 
> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> 
>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-update-SC7280
> 
> for you to fetch changes up to e95e9e07a7983f9e0e12fe9a6c185cf5b07fe2f8:
> 
>   qcom: update venus firmware file for SC7280 (2024-11-13 09:48:13 +0530)
> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: update venus firmware file for SC7280

Commit log says: "Update WHENCE version string to match with updated fw
version string.", however there is no WHENCE update.


> 
>  qcom/vpu/vpu20_p1.mbn | Bin 2031620 -> 2026452 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> Thanks,
> Dikshita
> 

-- 
With best wishes
Dmitry
