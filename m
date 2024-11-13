Return-Path: <SRS0=ZqBG=SI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4F5D41C06
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 12:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76F7AC4CED5; Wed, 13 Nov 2024 12:15:37 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 552EDC4CECF
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 12:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 552EDC4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so59399377b3.1
        for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 04:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731500135; x=1732104935; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyqVb5qhMtE5cPZHZR3eaX0XZlCr4l0jYm0wXfc57DE=;
        b=MrBb2SfaZ93Pabp6zGoW3EDKR26ZAi54Lef+USG4G54gLQ2skQBIeI/9eKM94WEdDH
         RCEc0ZQoUPj3xacNSL9KmQBYvinznwKHX7LB1Oi4aNjmGkX6QduwbcyaLPcA9f7i/1tQ
         46GlzheBWfGujT5w85mO+gNddRQdg6S3Pp42JsgKIIvyXvwA9sUDZqIwrxA59PBoBVzW
         QJSlU1PGvW1N8FZlPc0ngo48L0kYJSbuiRRy9+ldFR7S7y6v2Dn5G5P65alFBiZYY9A9
         eWYSxYuzy4lJXp+ngr/5k2NILf6yYAbBAuZWH83Iw7XVlYIa42hvfvA2wuBXYDSivDYD
         pfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731500135; x=1732104935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyqVb5qhMtE5cPZHZR3eaX0XZlCr4l0jYm0wXfc57DE=;
        b=IqH+lAas+0TwhPryGOST2XMV0pp9BOxFjvKKxhXcTJYqL4meiAN+5POYFnPCXjCUwK
         4k2uRw7sKsj0RbuFLjo7d1QkgM1lAPQDcLiUBnrgQrEqvv311dRhsU4nojUHbJcYn7pu
         EyOH8cfAWCZ3rKZoAp7K+t7+8M3hs7/Upq6WKiCzCBtAW3MkPHVIP7LV/uppeL/w1xVZ
         vbcwXuKT3jgKxNK5aati334OYFjOkM108fvE9lBNM9/ahS2VHfIdiINDjLczdRMyBKSi
         qvyQg6nkeUzG62xZlSke/h/0SBhhYloOzql5x0BjynUrPlSCjxTyB4tYgLTEM3hfyYA1
         HjPw==
X-Gm-Message-State: AOJu0YzOpXAb3SqUc7Ya3s0DIV9MmAflgUbm9dwxq8DBOs18Zd/zTDh7
	7WbmI+Dqz/gt8uyKscxcmY0RX1vSl59WsHXuzsn/CgglASHwwhVlf0udeR/rBlQ5dJy6+r4Je4P
	0A6yz0kmol4kjpdUPC38p/2E2Ly8KmzTFyIoI1g==
X-Google-Smtp-Source: AGHT+IGZDSxvtsi0LRhWE7Wda7+Ygon9m1CW3c3dlsqSJeHRQUGukRFosspk2ZEg78OhjqzhwbpiZz8Z6SpOweIRPSU=
X-Received: by 2002:a05:690c:4d42:b0:6e2:70e:e82a with SMTP id
 00721157ae682-6eaddf82fd5mr203897767b3.31.1731500135413; Wed, 13 Nov 2024
 04:15:35 -0800 (PST)
MIME-Version: 1.0
References: <6353f092-9816-8221-1233-c423767320ac@quicinc.com>
 <25xjjmnyg55hs7mqnqtk6tae26lr2r33qfon6rfimnonqzoitv@3bcpd4ybqqtk> <2bab11a5-ad3b-d9c4-f3ca-f077a0a3ceaf@quicinc.com>
In-Reply-To: <2bab11a5-ad3b-d9c4-f3ca-f077a0a3ceaf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:15:24 +0200
Message-ID: <CAA8EJpoO=2wcdWcdfvE=CmayGn-a5ms2Hg_hdWF_bWG1JWaXoQ@mail.gmail.com>
Subject: Re: update venus firmware file for SC7280
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Nov 2024 at 08:14, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
>
>
> On 11/13/2024 11:15 AM, Dmitry Baryshkov wrote:
> > On Wed, Nov 13, 2024 at 09:54:51AM +0530, Dikshita Agarwal wrote:
> >> Hello,
> >>
> >> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>
> >>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> video-fw-update-SC7280
> >>
> >> for you to fetch changes up to e95e9e07a7983f9e0e12fe9a6c185cf5b07fe2f8:
> >>
> >>   qcom: update venus firmware file for SC7280 (2024-11-13 09:48:13 +0530)
> >>
> >> ----------------------------------------------------------------
> >> Dikshita Agarwal (1):
> >>       qcom: update venus firmware file for SC7280
> >
> > Commit log says: "Update WHENCE version string to match with updated fw
> > version string.", however there is no WHENCE update.
> >
> Oh, Seems missed to add that in the change.
> I have updated the commit with WHENCE file now.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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
> for you to fetch changes up to aeede7afb7a186b62f9e1f959c33fd5f2dea0f7a:
>
>   qcom: update venus firmware file for SC7280 (2024-11-13 11:40:36 +0530)
>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: update venus firmware file for SC7280
>
>  WHENCE                |   2 +-
>  qcom/vpu/vpu20_p1.mbn | Bin 2031620 -> 2026452 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> Thanks,
> Dikshita
> >
> >>
> >>  qcom/vpu/vpu20_p1.mbn | Bin 2031620 -> 2026452 bytes
> >>  1 file changed, 0 insertions(+), 0 deletions(-)
> >>
> >> Thanks,
> >> Dikshita
> >>
> >



-- 
With best wishes
Dmitry
