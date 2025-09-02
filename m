Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0783CA0FFE
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Sep 2025 11:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 996FFC4CEFC; Tue,  2 Sep 2025 11:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E7BC4CEF7
	for <linux-firmware@kernel.org>; Tue,  2 Sep 2025 11:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813468;
	bh=ZMmzzQPyxUlsssfy3X7ydhD8oGWamVlxg+jh8FA6rSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ehjt3eG0EOT7Dql/t5Knokp6YYoAb2ET31cY3/Spwla7URs1OdEaZpjHJmyHdq0xt
	 eI44ilZoZc1zr70PiNDm4m8wSR3KaZbd76Ejd/mlig0eSxM3Dg4SI1JStTc2Pp7Kbl
	 qjxtW7cV/VjIo+0XE63KIrmeE7tdGKgdZWe8lDyoyteUQ814xJu2whkjhsTQdhYgrp
	 moNkpM5XUo2wR2L5505DLzsC4oORbaJujGDTmqPQ1/flJgrLd0TSpmGRM+51Y78eIt
	 7xPk49iNDOdZvsuE1NWwbzFlKGBs8h1hDuo/UJXSj+WKVca6zX7ZjCKYsEIhvyhORW
	 cRZGpwLQdxpbg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d6083cc69so45091307b3.2
        for <linux-firmware@kernel.org>; Tue, 02 Sep 2025 04:44:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YwaTGV2W8RaDCJurT7Ag9UwPXsytKzMWik1HY+658vUKqVtjxLG
	cTnEghNXHXfQpaKuihKeZTFmmLLHZy7D2M9YqOVWMpNXTMvR00JcaHjx2PwFFJ8U6mKVEsK7/aS
	lLvKWwoM9B9iut34lFprxj3GtUlgBzkg=
X-Google-Smtp-Source: AGHT+IEY4L8tsOPyxyM9UBj6aRg1lhwGUte6k0WKnCFieAv3AJ48tELdP0i2+2yLZw+n5sV7e7vIw4ANqzmIVOCw234=
X-Received: by 2002:a05:690c:7002:b0:721:3efa:6d05 with SMTP id
 00721157ae682-722764caa67mr133664527b3.26.1756813467736; Tue, 02 Sep 2025
 04:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <e4f6c65d-bf1f-4af7-a64f-f30cccdaaa3a@oss.qualcomm.com>
In-Reply-To: <e4f6c65d-bf1f-4af7-a64f-f30cccdaaa3a@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 2 Sep 2025 07:44:16 -0400
X-Gmail-Original-Message-ID: <CA+5PVA77jDhr=PO7tp3QB03viUJiqW2z7KfhSSdd4sGJZSA22w@mail.gmail.com>
X-Gm-Features: Ac12FXz-ypbJ0XI-Eq9sOU1Lx96nWsOiKrLmv-LG0vRYa2H_qOikjCvSvxBaQFE
Message-ID: <CA+5PVA77jDhr=PO7tp3QB03viUJiqW2z7KfhSSdd4sGJZSA22w@mail.gmail.com>
Subject: Re: qcom: add ADSP firmware for qcs615 platform
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 2:11=E2=80=AFAM Xin Liu <xin.liu@oss.qualcomm.com> w=
rote:
>
> The following changes since commit 993ff19b553cd4d252fdf99f07c28825ef57b8=
62:
>
>    Merge branch 'main' into 'main' (2025-08-29 17:13:10 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qcs615-adsp-91

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/671

josh

>
> for you to fetch changes up to 7aeff2162e6bb1875cabcf26caba01264194768e:
>
>    qcom: add ADSP firmware for qcs615 platform (2025-09-01 11:00:40 +0800=
)
>
> ----------------------------------------------------------------
> Xin Liu (1):
>        qcom: add ADSP firmware for qcs615 platform
>
>   WHENCE                 |   5 +++++
>   qcom/qcs615/adsp.mbn   | Bin 0 -> 8536204 bytes
>   qcom/qcs615/adspr.jsn  |  21 +++++++++++++++++++++
>   qcom/qcs615/adsps.jsn  |  21 +++++++++++++++++++++
>   qcom/qcs615/adspua.jsn |  27 +++++++++++++++++++++++++++
>   5 files changed, 74 insertions(+)
>   create mode 100644 qcom/qcs615/adsp.mbn
>   create mode 100644 qcom/qcs615/adspr.jsn
>   create mode 100644 qcom/qcs615/adsps.jsn
>   create mode 100644 qcom/qcs615/adspua.jsn
>
