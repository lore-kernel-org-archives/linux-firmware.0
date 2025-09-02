Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7366FCA0FFE
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Sep 2025 11:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F524C4CEFA; Tue,  2 Sep 2025 11:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C24C4CEF9
	for <linux-firmware@kernel.org>; Tue,  2 Sep 2025 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813546;
	bh=MdTI3FPAQML0yj22c4q/cQz7MTU2/CQgVVHrbuLoHwE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kKNtwxNXxm3Zd6bwVYytGXhRfDb1ERV7GosDsUV3hNUm5R5wZf2Vb/nULy+Wg/j0/
	 vh491pEY2WxZy7iVI9uI3CUD42MqG6NXFwoeXa7nfkoHutSJdsHAsFogGc1tDY/IyS
	 qvGHr2/Pdeta5SmYZWIJObFqOYLCOEZw++jGTGMmGG2q8wdc483nJgboroSMxs5CK9
	 kSqOeJcIdpwHW5JI84nVIu2TugOum0ajpWMHPgCV860nGwq/meY2ks46Vn/xpVREZM
	 2cwqcOucMSAQEo9hhFNtNknqjfqyKzOspvugayZmm6DO3FuQDUaOGm6DBddz13ipLB
	 L6NuHjTcqI2Lg==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e96e45e47daso3612007276.3
        for <linux-firmware@kernel.org>; Tue, 02 Sep 2025 04:45:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YyGC49MYb8oh1jKTj9dOCvMPZ8F1+8r5Jg0v3CONF/j7uvm/u6D
	REvQ5xh2eDnHz6HPdxwuqluRzJTqw54+YuUGpzfy+NvC0UPWpatS+xW7hUOD2IJ+WAHMD38od/2
	xPyUdMBmR+ed5ngj696afw+pftexunYY=
X-Google-Smtp-Source: AGHT+IFVDU4a6nx+y23HMxxDs7RGAkjgvrCtWkfhyXHwKMNLjscOpaqb/9/c5xZqFLO4zK1047q3giJIYxTP6gBmdWo=
X-Received: by 2002:a05:690c:720a:b0:722:8762:9d10 with SMTP id
 00721157ae682-72287629f1emr101625027b3.22.1756813545385; Tue, 02 Sep 2025
 04:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <310aa011-9ebb-478b-860e-1c8d13d50a6e@oss.qualcomm.com>
In-Reply-To: <310aa011-9ebb-478b-860e-1c8d13d50a6e@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 2 Sep 2025 07:45:34 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7MQYDGW04EN6RRA0YyB6sh3bj1qxk5fv5uFjs+t9z61w@mail.gmail.com>
X-Gm-Features: Ac12FXwtL6MXRjirU6P7-ZCOWTPNde0HO-JyxJCi3lYyaerAcgnJgVt8svbk6Y8
Message-ID: <CA+5PVA7MQYDGW04EN6RRA0YyB6sh3bj1qxk5fv5uFjs+t9z61w@mail.gmail.com>
Subject: Re: qcom: add CDSP firmware for qcs615 platform
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 2:19=E2=80=AFAM Xin Liu <xin.liu@oss.qualcomm.com> w=
rote:
>
> The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8=
b7:
>
>    Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qcs615-cdsp-826

This conflicts with your other ADSP MR.  The ADSP MR is merged now, so
you'll need to rebase and fix up the conflicts before we can merge
this.

josh

>
> for you to fetch changes up to 49524f3ee32837eee83bcf7fd3798967e764699a:
>
>    qcom: add CDSP firmware for qcs615 platform (2025-08-26 10:24:34 +0800=
)
>
> ----------------------------------------------------------------
> Xin Liu (1):
>        qcom: add CDSP firmware for qcs615 platform
>
>   WHENCE                |   3 +++
>   qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
>   qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++
>   3 files changed, 24 insertions(+)
>   create mode 100644 qcom/qcs615/cdsp.mbn
>   create mode 100644 qcom/qcs615/cdspr.jsn
>
