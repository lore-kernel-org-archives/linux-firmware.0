Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC28C61DB9
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Aug 2026 13:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F28E61F00A3F; Tue, 25 Aug 2026 13:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7961F00A3A
	for <linux-firmware@kernel.org>; Tue, 25 Aug 2026 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787662850;
	bh=uWBhckjlqOn1VqK9gf+IJNDSVZNQz1fP7xzppXyBO2U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc;
	b=IQbJErmyT10rbu+edtdPg/AegbN4k34RvGIklp6jRMm7lYdhRY69RSn037UIjt8dj
	 6LSmJ2OQmD0FWdvK/nN4NpBmwvL+PXqJfQmhqIr7OazSb6b4vYAMn0a8uM0kjXG17C
	 Jfyp2xr3eLp7Fspu3S/Pq149VFsX7dUdsC8uIK5ze90rcH9Yw8r/qsx9Gr7p9oxmb6
	 8y2DpzTe4lhqWX0NrjX37As2cjB99IGB8VHULGzi17kNMYU8qjhezRhB2nCOUX//3u
	 /ZSBR4Ab3XaIbtvG11ROtKwP5FkCEmdgw5/qeAaZXHPXJL8v80YYiAk3QxYFCsCQaa
	 H+FRnMkZsnVdA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66c70f69d3fso5256119d50.1
        for <linux-firmware@kernel.org>; Tue, 25 Aug 2026 06:00:50 -0700 (PDT)
X-Gm-Message-State: AFuF++lNCmEyQwf0DUwoutMpZJ/auhnK3uAGJJ0g2TcGuuB4d5GumITG
	sXtbGizcc4PtdXQ87KctM9QzHbeNFamaGmBRrcYBqDFI6Xo3+sZnotWwyZWHhoQxPvxrF/PKsri
	H8zErZS9U0VZn6Q9LyoMrqZ5JyzPmFBY=
X-Received: by 2002:a05:690e:11cc:b0:668:8dfd:8c7f with SMTP id
 956f58d0204a3-66d14b20016mr2226462d50.43.1787662850214; Tue, 25 Aug 2026
 06:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <b5813b12-dcdf-4418-870f-c331bc62a313@opensource.cirrus.com>
In-Reply-To: <b5813b12-dcdf-4418-870f-c331bc62a313@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 25 Aug 2026 09:00:38 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4xEy2Yeh35Kdxpj0zD6R8U1fLyy==WSMgKVEYheH_AFQ@mail.gmail.com>
X-Gm-Features: AcwNN1X9ONwzmcoUvJYT5V1wM4bkRG2k18YFhkS_PYK7fnLeI-n-w3QPGriFL44
Message-ID: <CA+5PVA4xEy2Yeh35Kdxpj0zD6R8U1fLyy==WSMgKVEYheH_AFQ@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l54: Add Cirrus CS35L54
 firmware mappings for an HP laptop (20260824)
To: Stuart Henderson <stuarth@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1195

josh

On Mon, Aug 24, 2026 at 10:57=E2=80=AFAM Stuart Henderson
<stuarth@opensource.cirrus.com> wrote:
>
> Hi,
> I'd like to add support for the Cirrus smart amplifiers in a new HP
> laptop.  In this case, just a few WHENCE symlinks.
> Thanks,
> -Stu
>
>
> The following changes since commit 6afcbccc10ce54c84fd06ece157a4f767138f8=
98:
>
>    Merge branch 'unparalleled' into 'main' (2026-08-24 13:07:23 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware.git 20260824-cs35l54
>
> for you to fetch changes up to ca34678b6c470626f7b9d4bd115e33f7e709c302:
>
>    cirrus: cs35l54: Add Cirrus CS35L54 firmware mappings for an HP
> laptop (2026-08-24 14:23:37 +0000)
>
> ----------------------------------------------------------------
> Simon Trimmer (1):
>        cirrus: cs35l54: Add Cirrus CS35L54 firmware mappings for an HP
> laptop
>
>   WHENCE | 5 +++++
>   1 file changed, 5 insertions(+)
