Return-Path: <SRS0=mrej=QY=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FE6CDE020
	for <linux-firmware@archiver.kernel.org>; Thu, 26 Sep 2024 16:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C347C4CEC7; Thu, 26 Sep 2024 16:12:33 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90E21C4CEC5
	for <linux-firmware@kernel.org>; Thu, 26 Sep 2024 16:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90E21C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2326896cbso7427427b3.3
        for <linux-firmware@kernel.org>; Thu, 26 Sep 2024 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727367151; x=1727971951; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qI5exi2UqWU11FE5nZsj/6ZyFbS46Vp8KU3FwjIepUE=;
        b=i0JXyJDumKqbwDbUcEKT7OMPiXt6IKi01V8UZpiXU/FuWQTMFanQFM715WNp6/dg9W
         ufS8W2/3ijILh4v4kVPrtxJsnfKiFBXoSlhZiRpliMZD3LE1oYua6AGmGEABya8BmsBA
         y+yFGl8VbAyAWyQPaBQqyOpiRP/M8jSXFPLVa7B7yQWkA/Qas80uc4taoabl714bHHTF
         NHDi3DXkK6xuTO3R2i3vra+h/IguMTcsC5lcFabz33rbMOEcv+74JFcDVwyhGslsexlB
         UnzzNfIdqZlWIIyqbI6fHVV4jWgZi7/CQaeScCnRC2RH48vBF2NwqvNanyoMTkgFrwEN
         hw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727367151; x=1727971951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qI5exi2UqWU11FE5nZsj/6ZyFbS46Vp8KU3FwjIepUE=;
        b=mZsigOUQ3k6vFZr5uCOzWjOHmq3vjJzPIBgxWT0PnBNv7iNzf3lh2vuB65p34bFKiq
         oL3srNGZuuzBHxWYpO0RgV0LI67s0W1ZNOMYbQfeY9zDrV5PVg6aknjsU3kMUGPN2fda
         KvqmXrFQjoX9GJPSISpV8FoxIzpCJ8LkgB4+X0jh9C4IHvVGSkJiFUJ7nBMojWbWqeUJ
         l8FAy9MlqR1e+h05VTMRkRfqfPuQEXa5SEqef0SJFlyBqjZG+q/MUlK9jyBtvlgRRvJg
         /w/+e9okwwIg6JIuZ2dXlMqH9Zk8OOAXHb+OICUJHrnIqIa4qsqOdZEd1Rrq5PkuEo46
         YpeA==
X-Gm-Message-State: AOJu0Yyinrrk9t6dSXAgX1XbZIcX3T7QdE697NQSbO2mOeYIZ20lQ7m1
	x2B+yJhEAGEYa5wbJkFEL2rpZ2dI0sViJ+ZdH+n+O0axdlKD4MFdOrGEzzMnKTCLfcQcZv86+a0
	ePkZ/WgFg1QmJlSY0iByA0RTxeIql7fI6dGhsjD+BbSaCCbS3EBqr1g==
X-Google-Smtp-Source: AGHT+IFCn/tJ/zinQMFUvXvqCI3Q0lhCpLKYD4fdopArlyKbOyglnKtUXdmc7NRKNIbaX6AgKUI8H5ckgSHwyi2kpEM=
X-Received: by 2002:a05:690c:7604:b0:6db:a7d3:6410 with SMTP id
 00721157ae682-6e21dc4dcaamr55553247b3.44.1727367151475; Thu, 26 Sep 2024
 09:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240926153701.ymwkxr64x65b7euq@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240926153701.ymwkxr64x65b7euq@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Sep 2024 18:12:20 +0200
Message-ID: <CAA8EJpoVTxHX1x7BT6PXYQ4FKfgjedfdsYpBFqcbMrY8y12atQ@mail.gmail.com>
Subject: Re: qcom: update gpu firmwares for qcm6490 chipset
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Sept 2024 at 17:37, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Hi,
>
> Add/update the gpu firmwares required for Qualcomm's QCM6490 chipset.
>
> -Akhil
>
> ---
> The following changes since commit 8306534b8a7265bee2f4323b45fd2a22a7c8b9b6:
>
>   Merge branch '8922a' into 'main' (2024-09-23 12:36:21 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCM6490
>
> for you to fetch changes up to 2aded3b604ae42d3f6b1c5a5873db021ec4e4207:
>
>   qcom: update gpu firmwares for qcm6490 chipset (2024-09-26 20:47:08 +0530)

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you!

We will need the qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
symlink, but it can come as a separate patch.

-- 
With best wishes
Dmitry
