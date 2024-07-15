Return-Path: <SRS0=/xlt=OP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E304C3DA4B
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Jul 2024 14:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A13DC4AF0A; Mon, 15 Jul 2024 14:15:58 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 058A6C4AF0F
	for <linux-firmware@kernel.org>; Mon, 15 Jul 2024 14:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 058A6C4AF0F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e057ae1adbeso3239310276.0
        for <linux-firmware@kernel.org>; Mon, 15 Jul 2024 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721052956; x=1721657756; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R2wB2W0fKwhATZ+3uinQ9oRmxEy7VIVSTwoUTBV0Uek=;
        b=uPvM1sJvEAA+fQ4ByGx4KRwUo/e+E4O0lm5qguIjjykWYJCiqkj+0o95ZqvbENs1R5
         HbQT101B1I84wljyQmKDfe6qAMQPJIw04US95LNPoM9ceoDuteRVrEmKvj9uVFssSyYc
         Zlk6CWImKe2F0rmfS/oORNd5f2tO48oKOsG5tyC5nOnLX5kOZM4Ff4ctszvtjHxG3vMh
         IKDJFpdDd0bzMYDQ2KPrsv3/+9pNc0mGDi4p4eVEj2P4jzwFekN3FLbjN3AvnfbLng4h
         XTCKYT8i1y2BJHLHgzVK/IKtGnLZUH5cgbU1fnYhuk30/GYqv4nxHwWu0zEYsQgIfHNN
         oCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721052956; x=1721657756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2wB2W0fKwhATZ+3uinQ9oRmxEy7VIVSTwoUTBV0Uek=;
        b=GJbJnclopXU9XVp++TQx36fuWt9wCVvGnqp2fXETDKcPX9hU7FntRXqURTpqXs0nJF
         SHoAc4Oh4v4Ly3iMUTz7L9fUFjphdlp51t/Ihu2yZnYeefWpPKhQ/I9N4ER+VGXuZrSF
         CEac66InyAmIJ6qVedsdmOSQ5eZS8/6qqj/mrcXdXz/0QP68C7L8AifHJQIxtdG8houy
         UvA06xKsKk46k0eh9EAaMot+IrEGpZEBkO9cJKyJ7Z45S2Xz/pQDPsyIPAC5QL/SztDL
         Z2MteQMHX8IWr6CMyDzkLs8HB21HYZltZSy9ltXQu7D+gJkD5zuSPr73r53cnLo57fZZ
         wJ/g==
X-Gm-Message-State: AOJu0Ywz14AYtGN5dNUqjjeix4zt9RjP9p24JRomzXIdJ8cAKAy9vqzc
	LL+zbDUAcde+5+8nBwCbVYEuvMAjJ4P6oiF1t4cX5WBcpr/QBX7ic6gRAhDry0LrSmDP8F7X9Rc
	JHp3O4EuKdo5ISsonkkZsmwhg17DO/Y0O+JXeqL4fJ02Lq32PrOc2Rw==
X-Google-Smtp-Source: AGHT+IFSnls45DRWzcf09yMhTK+spEP6tpEh1C0wOeRCIP6b5YLKMSx7ejE6MxjLgDPh49CBh90q8yIPNwxUUr37SLE=
X-Received: by 2002:a05:6902:1615:b0:e03:359a:6a54 with SMTP id
 3f1490d57ef6-e05d25e44f2mr82710276.6.1721052955898; Mon, 15 Jul 2024 07:15:55
 -0700 (PDT)
MIME-Version: 1.0
References: <20240715122500.3115456-1-dmitry.baryshkov@linaro.org> <20240715140351.olqzaiz32jpplpnx@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240715140351.olqzaiz32jpplpnx@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 17:15:45 +0300
Message-ID: <CAA8EJprZ2x7tkLnOq4pyuAYqDHgt8C0EGHNbhhK7Xqve4Z+4tg@mail.gmail.com>
Subject: Re: [PATCH] qcom: move signed x1e80100 signed firmware to the SoC subdir
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, quic_rajeshk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 17:04, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Mon, Jul 15, 2024 at 03:25:00PM +0300, Dmitry Baryshkov wrote:
> > The ZAP shader is signed and is specific for the particular SoC. As such
> > it should be put the corresponding subdir rather than the topdir.
> >
> > Move it to the subdir (like all other zap.mbn files).
>
> This need a similar change in x1e devicetree too, right? Are you
> planning to send that?

Why was the firmware name incorporated into the x1e80100.dtsi? Yes, it
needs to be dropped.

-- 
With best wishes
Dmitry
