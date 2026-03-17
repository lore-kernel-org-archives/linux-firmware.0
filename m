Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDDAFD8740
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Mar 2026 11:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52F48C2BCB1; Tue, 17 Mar 2026 11:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6F0C19425
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773747241;
	bh=kdncjmEUsj9rzxFJd2Wh+kB8gKsv7BzDlY0HHFhL++k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mhBUYfMtRl4bDT3XSqsbXnRSIJq2RkO6Q2M0NAK5jL/bk3YiL3ZTaCz3Fc4arVzDo
	 MOYmJzwTydz9SAnr/oPMTFzMDI9rZG389s+Wc8CD6BfOULAOYZ9H1oH8+agS6/jtMY
	 Oq5GfXm4hocxgxE0Boe3y5rO9RZGjnR0hkWmWLzFGjlTfjcRHbcREpapIke1zGJkAD
	 Owi99ZzcYQIULroCnLat7fUAFhreP5HHa25J8zBqjg/+goQVrYkkeE/pKEI0RcMnj+
	 dVhkq/vtiLAlg/JyY135SDG/DyJShrY6VXDOcBpZZS8mvvQR6CA2AWOGT+24hncfzv
	 HAiU7055bKBAg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ca1ba0089so5462849d50.1
        for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 04:34:01 -0700 (PDT)
X-Gm-Message-State: AOJu0YymECRuqm8HbEohMfaUeAtStoAcrMEOCw6X46RN5jqZQk11OEuM
	bGhoWywOn7t+Mp0Ffj29BgrTGzX2CPzOwyaCou4hNaYj4ve8c9jlws/9NW94gEbslSsCkuuOFKX
	F35Acw5wbMz/LIsENRjEygm70KPZ9YAc=
X-Received: by 2002:a53:accd:0:20b0:64a:e799:1d92 with SMTP id
 956f58d0204a3-64e63084001mr12880030d50.61.1773747240437; Tue, 17 Mar 2026
 04:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <SJ0PR11MB56137ED0F14537457946FE499341A@SJ0PR11MB5613.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB56137ED0F14537457946FE499341A@SJ0PR11MB5613.namprd11.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 17 Mar 2026 07:33:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7EJ2L4cZaS=rmpY9o_pqWaxCvKKYiRHBW79fwc3sqq9A@mail.gmail.com>
X-Gm-Features: AaiRm518Yfe0q7OHOgAiWzxtk2AemT7I5SvdvSm-DL9-YCUIqyWdMDwDVfyMHvI
Message-ID: <CA+5PVA7EJ2L4cZaS=rmpY9o_pqWaxCvKKYiRHBW79fwc3sqq9A@mail.gmail.com>
Subject: Re: [GIT PULL] linux-firmware: Add ISH firmware file for Intel
 Wildcat Lake platform
To: "Zhang, Lixu" <lixu.zhang@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"dbaryshkov@gmail.com" <dbaryshkov@gmail.com>, "superm1@gmail.com" <superm1@gmail.com>, 
	"Wang, Selina" <selina.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 9:30=E2=80=AFPM Zhang, Lixu <lixu.zhang@intel.com> =
wrote:
>
> Hi linux-firmware maintainers,
>
> About a week ago, I sent a git binary diff patch for `linux-firmware: Add=
 ISH firmware file for Intel Wildcat Lake platform`,
> but I haven't received any confirmation and suspect the email delivery ma=
y have failed.
> To ensure the submission reaches you, I'm resending this contribution as =
a git pull request.
> I apologize for the duplicate submission and any inconvenience this may c=
ause.
>
> Thanks,
> Lixu
>
> The following changes since commit 57303edc4101c1003ec45e91652f281ebd2f41=
b2:
>
>   Merge branch 'robot/patch-1-1773363694' into 'main' (2026-03-13 06:29:1=
1 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/lixuzha/linux-firmware.git intel-ish-wcl

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/960

josh

>
> for you to fetch changes up to f71ae94fbda284707cfa3dd9f10c2e4d8a745ec6:
>
>   linux-firmware: Add ISH firmware file for Intel Wildcat Lake platform (=
2026-03-17 08:55:35 +0800)
>
> ----------------------------------------------------------------
> Zhang Lixu (1):
>       linux-firmware: Add ISH firmware file for Intel Wildcat Lake platfo=
rm
>
>  WHENCE                |   2 ++
>  intel/ish/ish_wcl.bin | Bin 0 -> 920064 bytes
>  2 files changed, 2 insertions(+)
>  create mode 100644 intel/ish/ish_wcl.bin
