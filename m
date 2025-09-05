Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A3DCA0FED
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Sep 2025 12:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D8AEC4CEF9; Fri,  5 Sep 2025 12:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AECC4CEF7
	for <linux-firmware@kernel.org>; Fri,  5 Sep 2025 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757075363;
	bh=kyqhe0WR2Zowfgz5BY8rhIrSqmVuIbVMDUfpH7/tF/E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CeANOIjlROBss+46+MeeShFG0b1G4x0e7U27zI/d9ZqJMbqyjsd00kcqHPQVguEYz
	 tj3aIYOjmPfsssAhO026avEXrvVfri8EE1cZs5IMBvYHL8BQJYECkaUuZu5QooQLTZ
	 Y+C+ewDLH+NbXLPEF/AjyaPkCuKQfUxKS/W04axF0NwAJIcH49sKsCaBsPCauGO1n9
	 cVhfWUA8H5gizuGz42OHJqVNczF6D8uH5w5+jDUkDZRmfybzyR/XTWoR8Frok7hCU6
	 ZkPrRUCapp/5UX/qPgU0AyrA68E+8oR9i+Ao2Jkcz70a0K2lqfVrRHI6O0mSAXTCJy
	 l4c7/ey6QTNkQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-723bc91d7a6so19561287b3.3
        for <linux-firmware@kernel.org>; Fri, 05 Sep 2025 05:29:23 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx9p5zf2d9UVKijSoGgdq6GOmCp+rBTZa6UNcshTcCEabW9vEh5
	uBD34vGQVUoyh+4D7zrLg8PNXl2ic7HdpDTDhrM6tEbcQJ/s3ingC3HgVjZuQhhB3cJZg0swoMc
	bbMlZ9rrV3O78flu2Dn7s1Az/u1c2jAc=
X-Google-Smtp-Source: AGHT+IE+1W79F3RFCFa6IXgbSUU9JalZ5DZnXRT5bj7fI4Bwi55nC9E20OwCD7jtUpB53xZosYaPI7FVG7PEWelD5X4=
X-Received: by 2002:a05:690c:a084:20b0:727:121e:fa40 with SMTP id
 00721157ae682-727121f0640mr6494367b3.21.1757075362273; Fri, 05 Sep 2025
 05:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <cd3515c6-5a63-40e7-8399-84de460b2f5c@oss.qualcomm.com>
In-Reply-To: <cd3515c6-5a63-40e7-8399-84de460b2f5c@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 5 Sep 2025 08:29:11 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4erXurvcqS7pDfBL5HsLWb5KUeLM+k_53hu7S_Jdfv1A@mail.gmail.com>
X-Gm-Features: Ac12FXwDFRIpsupqAUz190FxyTA4lzzsDS_eMwEe_eo_QGL75o6q_l9BfzK_x4E
Message-ID: <CA+5PVA4erXurvcqS7pDfBL5HsLWb5KUeLM+k_53hu7S_Jdfv1A@mail.gmail.com>
Subject: Re: qcom: add CDSP firmware for qcs615 platform
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 10:39=E2=80=AFPM Xin Liu <xin.liu@oss.qualcomm.com> =
wrote:
>
> The following changes since commit 577ee67ffca254fe7ee3a7dc5bcf0b8f749f29=
02:
>
>    Merge branch 'robot/pr-0-1756931524' into 'main' (2025-09-03 20:41:46
> +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qcs615-cdsp-9

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/680

josh

>
> for you to fetch changes up to 82b34c45e9ffbc2894a7a870701c24ce9a30e734:
>
>    qcom: add CDSP firmware for qcs615 platform (2025-09-05 10:08:14 +0800=
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
