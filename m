Return-Path: <SRS0=jNYL=H2=gmail.com=jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB214C35274
	for <linux-firmware@archiver.kernel.org>; Fri, 15 Dec 2023 12:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BB38C433C9; Fri, 15 Dec 2023 12:17:57 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FC22C433C7
	for <linux-firmware@kernel.org>; Fri, 15 Dec 2023 12:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8FC22C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dbce6056e85so479485276.3
        for <linux-firmware@kernel.org>; Fri, 15 Dec 2023 04:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702642675; x=1703247475; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVUgt3o5mUcfJYh8WI1Bvo3s5NmfbkvnzCcFCafce1g=;
        b=iykT6LW/8gahQxu2sAZF3WMSA5pZB6k+U+t5KpHNfGMpaMbiSkFku6Rc6/w9MORTKi
         N7Fo1VrU3lfUCOrFvtUnX6jH16TRxfJ2jfPjRb5fBd4C6cPARQFqg/mF0gWrWFfNlMG5
         1IQq4ypg/2KN6FXkq7o/AhYPo0Eg73j9qY0RRU8X4JCbTqCswFQs1y68t8QzSUagmtsP
         AwJV/R9x0HUWSlLHM82Yt3lDPxO3fj/H7wbBofRU6FpAAbFWbutKpelcoQwsuDScDQai
         BiYVsq1S5SVRoB6Ec8Y8avynmbkeIOkZk8zFuJ+p5VHKAGeYiEk/F/y7rfgOSisDFi/W
         ENKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702642675; x=1703247475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVUgt3o5mUcfJYh8WI1Bvo3s5NmfbkvnzCcFCafce1g=;
        b=G6b3yAuDADI0Q8ZXT2RrmqQA13WwiCZEyAi/ZjvsrPpdtUTNa9Bz9OgNx/OQIb+1gH
         CgwkKfr0fEjz9gl1STRNlbAOuYTETo17itGnB6yzEnm0GmCh8JMCu3F8GThw6g5Za1fc
         M6RbHCPwiH1iBDe3xbZCEIjW9fr3PTISOAp2KxnzBiUHb4FRLpold/zxr8/LObaP154W
         XpBIUny6Dwixu3iAXSX8nJ+mBoQhn2R1iPgQBkec4Q1wKjYH8SML6BU/fhVI/RdKnW4F
         D3rC3jvP6G/0eDnVwMZRuYspa8UeA/oH9PsoF58nf0p2IjptMBtWFPPtlE6ZxDlf4ZvZ
         3guw==
X-Gm-Message-State: AOJu0Ywjb7uggqaWSi9h6pMqAL7nmWMzHUftS6gwD5focZPT9AqcV54y
	h6QQXjmBcA3azJ5LMeNkq5UoHJ+/eTvEmUC5heo=
X-Google-Smtp-Source: AGHT+IFeJ9g1nM4/h4KsH4odOlzsrb69XGUx2rrfVzZQhgOKkL55WPfX5PkQXV5nZB5KEtf9wL8VbLU1tByFsCqpl/4=
X-Received: by 2002:a25:6d45:0:b0:dbc:de49:6366 with SMTP id
 i66-20020a256d45000000b00dbcde496366mr2491851ybc.18.1702642675365; Fri, 15
 Dec 2023 04:17:55 -0800 (PST)
MIME-Version: 1.0
References: <1353f064-62b2-486e-b6d3-1f9fcf5bb1e1@linaro.org>
In-Reply-To: <1353f064-62b2-486e-b6d3-1f9fcf5bb1e1@linaro.org>
From: Josh Boyer <jwboyer@gmail.com>
Date: Fri, 15 Dec 2023 07:17:44 -0500
Message-ID: <CA+5PVA6Qj5a8s2dSXTp2t32mNC76MwdXHbZWjOyCECM_bTbi2w@mail.gmail.com>
Subject: Re: [GIT PULL] Add Audio topology firmware for Qualcomm SM8550 and
 SM8650 QRD platforms
To: neil.armstrong@linaro.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 7:55=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> The following changes since commit c52dc2526009abe1a685f190423f605c01ac1b=
86:
>
>    Merge branch 'mlimonci/missing-dep-ci' into 'main' (2023-12-12 11:56:2=
6 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/neil.armstrong/linux-firmware.git sm8550-sm=
8650-audio-fw
>
> for you to fetch changes up to b80907ec3a811aff9afdeceb7410ad408f7e0de4:
>
>    qcom: Add Audio firmware for SM8650 QRD (2023-12-14 13:22:35 +0100)
>
> ----------------------------------------------------------------
> Neil Armstrong (2):
>        qcom: Add Audio firmware for SM8550 QRD
>        qcom: Add Audio firmware for SM8650 QRD

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/98

josh

>
>   WHENCE                          |  18 ++++++++++++++++++
>   qcom/sm8550/SM8550-QRD-tplg.bin | Bin 0 -> 24296 bytes
>   qcom/sm8650/SM8650-QRD-tplg.bin | Bin 0 -> 24296 bytes
>   3 files changed, 18 insertions(+)
>   create mode 100644 qcom/sm8550/SM8550-QRD-tplg.bin
>   create mode 100644 qcom/sm8650/SM8650-QRD-tplg.bin
>
