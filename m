Return-Path: <SRS0=5j3L=QP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361C0C35FEC
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Sep 2024 07:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 082FAC4CECF; Tue, 17 Sep 2024 07:24:34 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF64FC4CEC7
	for <linux-firmware@kernel.org>; Tue, 17 Sep 2024 07:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF64FC4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6d6a3ab427aso37561517b3.2
        for <linux-firmware@kernel.org>; Tue, 17 Sep 2024 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726557871; x=1727162671; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OmgscrOPhMEcy0uId9tGU3KjdrIyplMAEWEgLPs05Y8=;
        b=kRX5wHtEfccUpyFiJq1DclHwY14xW7YfN3y9c4wi5D8Dght+36Wb6fa++o8mJ2bvUb
         +d7OnaYRkSAj27Y2FmffXofYKcPctoLiKDMTjOlNBeRGQDfkimC+yZDSYFrpfI6V0qY/
         nqMDrdR9o0590M2gowSSBp5Ix9ByLrLn+bt477I00Bqh4vGRrbWPIOIGpXOXqjF+Rkpu
         pgp+v0vDtYCTyIGD7jveLfojMpI4bQyRoEEP5g7VmJtZ+Ux5OdCtolcc1WEeOGe/AK5B
         d6Rm4vxoC58gh5ySXcNsT9nLffiHqkO5rXv2NlhwUoziHr/SAOgaQkJj5KOq/a9B+jwa
         mWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726557871; x=1727162671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmgscrOPhMEcy0uId9tGU3KjdrIyplMAEWEgLPs05Y8=;
        b=WsUFOBWSvKP8lGyeOgX306/LS6npPBzfj5TsDNI3/E+r7cUJlE9agjOhQo9ywuEJ06
         77oP8BjH6PlZ+xxBS6gsUqe6CnwXgtBBbBXHEsgJ381FKY8/x7RwxYe+ddONg2a0muBC
         Kt5ENuJ4dcrobK7e84gJuCMA06SnHUBo0pDteHlZLyVI0ehwS1aDA5O35rTdg9zGSila
         Z1AjviDYxrgbiUWdLuDwrlRUaeDfszdls9rtrCLJSDuBHZCNlnGzSMyGiW5K/SFq/NW9
         02L75Gn+Qs9P6dipUuwvGUrOHfG95vrbKiHjefo3JHpFBDw9Jz5/0MLtroYBik8mvcZO
         IWaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdrBVpdZEpFynfLTtm2KnVopl0eq2u5iibUzv4JU1CbjjSlNqRG7qxAaXDngPFJkYDf5ji2FhZ9bz8LidbSg==@kernel.org
X-Gm-Message-State: AOJu0YzMuvs484+wNKsrul0PPWjbGmPU5pP75ECqMQY1NC1IuGUxf2oQ
	THZSffFHPrt3CxCrgL3v+5JygKKpx9KRav5nlsGcmz0Z3P9MPU5M2pGz7Hztt0MXVGL5YEEvjOn
	L7fluXNK+1AFGFPdNz71jZ5JJq+loDxKEoH8hAIwfm6f26+e/PU4=
X-Google-Smtp-Source: AGHT+IEY652w068+1jH/6xJFViHxLxQAP6EDYnODteIzAmiVPzZuQA0QRaZhXskrovkGJTVqpK2aYdl5Aa9N2mRS+bA=
X-Received: by 2002:a05:690c:dd2:b0:6db:afa4:7600 with SMTP id
 00721157ae682-6dbb6ad71e8mr162813837b3.4.1726557870787; Tue, 17 Sep 2024
 00:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240917071016.gp43cuysm4kdznzx@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240917071016.gp43cuysm4kdznzx@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Sep 2024 09:24:19 +0200
Message-ID: <CAA8EJpp4tGH_v7z9Um7Y+xxWPyFFMq4P3-cytNSJe3dqhLD_OA@mail.gmail.com>
Subject: Re:
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: GPUfirmwareforSA8775Pchipset@hu-akhilpo-hyd.qualcomm.com, 
	linux-firmware@kernel.org, quic_rajeshk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Sept 2024 at 09:10, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
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
>
>  WHENCE                    |   2 ++
>  qcom/a663_gmu.bin         | Bin 0 -> 55892 bytes
>  qcom/sa8775p/a663_zap.mbn | Bin 0 -> 1054680 bytes
>  3 files changed, 2 insertions(+)
>  create mode 100644 qcom/a663_gmu.bin
>  create mode 100644 qcom/sa8775p/a663_zap.mbn

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you!

-- 
With best wishes
Dmitry
