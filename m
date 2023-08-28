Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD22CC83F11
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Aug 2023 10:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72CCFC433CB; Mon, 28 Aug 2023 10:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C890C433C9;
	Mon, 28 Aug 2023 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693220129;
	bh=dm9y9OCP+t43iO19XArWc+A5EajPmlhWmQiniBBe6EI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=f39yRMGx1Ul4Hlmuh7KqOqegKQKbJlfjnmRsJGT5wGIgYo3qYYqyE/j0whIppqkCT
	 zZQiFUMzY8xT+5s13uZ2P2QKFp1znV78UFeal2TEkIN+DtlCKGwqBa4xUFFpaEvXiN
	 ZJmWlOcioZ3lTpz72iSTuR5zyO2LtFtEBqyBrn/CnOaRg4Ji/yodZWHTv6LcV2dfcn
	 iJGBMwqcKTGLqQH+NaAIrM89IhxgA/Ud0zzDGV0XfrKfM6Ib/XOPwHC5nviMc2gqJL
	 kXfvWEqFh1XrL9IUnPo+CHi7QvL+3x4WtEqO6IynJtQgwuUgLU2798e1K4JRkxVbZ2
	 ydUYqUxg8COmw==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d72cf9156easo2710572276.0;
        Mon, 28 Aug 2023 03:55:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YyKM3FWT7NP6hrnKKs10420t+8W9mwpFPg8bamrmRPwWNNph3D4
	3tnGR/Twnpr2evXjB8o3+adS+gKSsUxWlbuDLQU=
X-Google-Smtp-Source: AGHT+IGSgbXBFnZtjGGBOVBt1hFAkHS/vTA4TQkoHVcdFTW9O/hoMnUCw3DaA7J+fGZ8VB7l+dYXVgNG9PZL7VG7+30=
X-Received: by 2002:a25:4014:0:b0:d08:20f1:f7cd with SMTP id
 n20-20020a254014000000b00d0820f1f7cdmr24139775yba.16.1693220128411; Mon, 28
 Aug 2023 03:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230823184247.1767725-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230823184247.1767725-1-daniele.ceraolospurio@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 28 Aug 2023 06:55:17 -0400
X-Gmail-Original-Message-ID: <CA+5PVA61vRm9ZawR=gh_FLPEniOLdX0udQjjro3q79_yGOasuw@mail.gmail.com>
Message-ID: <CA+5PVA61vRm9ZawR=gh_FLPEniOLdX0udQjjro3q79_yGOasuw@mail.gmail.com>
Subject: Re: PR for GSC FW release 102.0.0.1655 for MTL
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kyle@kernel.org, ben@decadent.org.uk, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 2:43=E2=80=AFPM Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> wrote:
>
> The following changes since commit 0e048b061bde79ad735c7b7b5161ee1bd34001=
50:
>
>   Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-fir=
mware (2023-08-14 13:03:41 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-firmware mtl_gsc_1655

Pulled and pushed out.

josh

>
> for you to fetch changes up to 81caac98eda16944446fa057191ee969c377154a:
>
>   i915: add GSC 102.0.0.1655 for MTL (2023-08-21 14:13:11 -0700)
>
> ----------------------------------------------------------------
> Daniele Ceraolo Spurio (1):
>       i915: add GSC 102.0.0.1655 for MTL
>
>  WHENCE             |   3 +++
>  i915/mtl_gsc_1.bin | Bin 0 -> 1142784 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100755 i915/mtl_gsc_1.bin
