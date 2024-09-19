Return-Path: <SRS0=OT8y=QR=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F1DCE8D5D
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Sep 2024 08:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8333C4CEC6; Thu, 19 Sep 2024 08:09:24 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B012FC4CEC4
	for <linux-firmware@kernel.org>; Thu, 19 Sep 2024 08:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B012FC4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5365b6bd901so582906e87.2
        for <linux-firmware@kernel.org>; Thu, 19 Sep 2024 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726733362; x=1727338162; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=75PVb12CHLDyKundjjWH78zKI9KLa5n0Wg01rzj+p98=;
        b=mQFjoOUstfVjzWKj47PFqhqj8qXxv43lM/Z8cPx5Ug9l0YM07i69LI8bMzvQ5HVy62
         NBnOgcLF0eR0QRFpNq8KJytqStksJFNZWiTFRTDbkdbO6juqDJAoWtmSScG+b3AYZDpw
         GPJHkmP9ix2dKIpkq2Sh3+MxArrAnz+a4fUl4saduSEFQcr5gCk8yu9nQZJ1oQxg8TWR
         wWv29F6vKpdrK3q9JkrFfGatNQ4tSJ2okekVrT4sXpNRS1oS5dbo5Gc67sobGLqeJKtP
         x8jbsFDU5oQlxzkhbowGsjucAfa+KxX4QnPvE0wa0Vs0XPJHjO6wCL05R72qFhUVoRBn
         jDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726733362; x=1727338162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75PVb12CHLDyKundjjWH78zKI9KLa5n0Wg01rzj+p98=;
        b=ohH5cYdSh2yGVhm5bmGejChhA1uzS3r7rVjVWwpugSabmfUrz5d/zYIchO9U2wTv8g
         J7ohMWi6FX4LFlxgdRutBKY7wQV6w6+VTeEsWFAB2OgO+/pv8adVgseJV/9DT0K4jwUz
         BI9G2pAkrJ/UfeEHjVJTqw5VUvp/Ff30/n2Rc3rr8iCvlCBdNsTA+D0lLi9U+gcqQLyd
         C9w9sf6dF+GpkraByeDGKafNnEGzvyQ+ZWOJIKLT8iQLNNauQk33oIn47eA1AeRzfkmi
         jy02PLJ9NEr+5WdbZdNqAoOPXFRIxDmdat06mEhFvzCVvZDa7A4SCJsX9iVJvxngEToT
         ytGg==
X-Gm-Message-State: AOJu0YxChuFxslICqv9FM1DgFRwcgH84R2y7iISpYbNQjvLJf38lM4Xe
	x48bNU5PqkSCIRBv/eN1KA2D/EjDnTASzAmPhWemQ504D6dseCQMSv0TzoItNYM=
X-Google-Smtp-Source: AGHT+IEy0cBi5KPy1UpAqVbqmsSUp4jyKyM1qfDAs960ezO9alqnJ30TqZ2WgTAKAfNNRWP4n1lk8w==
X-Received: by 2002:a05:6512:b96:b0:52c:e133:7b2e with SMTP id 2adb3069b0e04-53678fc9930mr14303799e87.35.1726733361562;
        Thu, 19 Sep 2024 01:09:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704db16sm1785080e87.107.2024.09.19.01.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 01:09:20 -0700 (PDT)
Date: Thu, 19 Sep 2024 11:09:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add gpu firmwares for sa8775p chipset
Message-ID: <3k6hcglmy4uhdeclyvuekpfjm7cod33a5fxfernrmqprwkzz3s@n4fgdkpx5vbi>
References: <20240917210323.tkzmi53qbm7jse4n@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917210323.tkzmi53qbm7jse4n@hu-akhilpo-hyd.qualcomm.com>

On Wed, Sep 18, 2024 at 02:33:23AM GMT, Akhil P Oommen wrote:
> Hi,
> 
> The following changes since commit 6c88d9b8253b8ec6df701a551a56438ea2e5bacf:
> 
>   Merge branch 'amd-staging' into 'main' (2024-09-13 20:28:50 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-SA8775p
> 
> for you to fetch changes up to 43c971bcd74d9793140a8fbbcc805204cb797f96:
> 
>   qcom: add gpu firmwares for sa8775p chipset (2024-09-17 11:57:51 +0530)
> 
> ----------------------------------------------------------------
> Akhil P Oommen (1):
>       qcom: add gpu firmwares for sa8775p chipset

Still:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
