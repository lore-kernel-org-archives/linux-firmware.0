Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F53E77197
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Jan 2025 17:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1B9CC4CEE3; Tue,  7 Jan 2025 17:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5B3C4CEE1
	for <linux-firmware@kernel.org>; Tue,  7 Jan 2025 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736271321;
	bh=U6KDCqyMLDwVuh2Itjhbn+h4fczF+j9iAPvGhAnjdj8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=J3oUuK/A0gCAS09xGLuNhM9dzckXM0DKALOh07Rzcyt84fE9vM5dKprmz4gYXZHhX
	 53FJSgI/QP+rLCSmgzgn//rcrdODdDTngq+sAiTI90lGRiyG43Bs86iWr3B5+yR49e
	 j96PTM7tm39hLx6OGW819Jj4Mg7Kl2zs8J/jA/P9xqoxD5Llf+SCsDySXzIoawa/dw
	 EK4C6kHHkTsKD9ujGkbmYxQi2Svfl0+UaBLCchUl+iVAjEiqpf1DyVB+abq5I8K6HD
	 NVCJHHcc/jAqYv9JdH/esvpmPDNbfQed4et6Bbse+50Qp0Qu4SCrW491DHPImC3f/l
	 m+RCS3eq1e2iQ==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e53c9035003so19901460276.2
        for <linux-firmware@kernel.org>; Tue, 07 Jan 2025 09:35:21 -0800 (PST)
X-Gm-Message-State: AOJu0Yzb3cpcQiAjdQo4wZEWVfg9eLJBqUrI3vCnHOdTYTAPdaqNpUX4
	TzQkLy61QR8K7PrrZJt6+vsDUgLIFuVIJUsRKcZxsyI+HpwFXUavPSobdzce5NjP43URPLCi86I
	wGAETY+Y6x0T8hqbbn5y2eVkQ/tU=
X-Google-Smtp-Source: AGHT+IFMLhfHwKpmvWfps+WJy6JUky0dWzlqm4c2BdTsj3LAdxngb8KOKuC+v7chTGkFCRVaA/ICv2QODlNp41l/fPM=
X-Received: by 2002:a05:6902:708:b0:e3c:9fb5:838d with SMTP id
 3f1490d57ef6-e538c25d881mr40549886276.17.1736271320806; Tue, 07 Jan 2025
 09:35:20 -0800 (PST)
MIME-Version: 1.0
References: <1ba69d302cffb859053c38433e2fd47bf69eb1ba.camel@sapience.com>
 <CA+5PVA5HoXfRjPJ4kZ0_okDkOx-pvVhbMH_6QSfoJYCTQxB_3A@mail.gmail.com>
 <d86e6e6f50afee488d17a43979be6c8564f4e296.camel@sapience.com>
 <CA+5PVA5eHh6uQM+7ecdK3QP2WQ=5Hd_qkn_GZ1By=mD7qiQqHA@mail.gmail.com> <9fb63a9445831ac894e061ffd2353874f546a891.camel@sapience.com>
In-Reply-To: <9fb63a9445831ac894e061ffd2353874f546a891.camel@sapience.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Jan 2025 12:35:09 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4Gv5NL=64AnDzU+fE-1HSHM=_Wazhqrige9hHMV3NqdA@mail.gmail.com>
X-Gm-Features: AbW1kvbZzcHQrVGsNH96WAT24ux7Y8cZg89CgoqOyIbkCG0jGryYw-JM7pzl2lo
Message-ID: <CA+5PVA4Gv5NL=64AnDzU+fE-1HSHM=_Wazhqrige9hHMV3NqdA@mail.gmail.com>
Subject: Re: copy-firmware.sh bug in has_gnu_parallel()
To: Genes Lists <lists@sapience.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 11:43=E2=80=AFAM Genes Lists <lists@sapience.com> wr=
ote:
>
> On Mon, 2025-01-06 at 11:35 -0500, Josh Boyer wrote:
> > > That explains why its absent in my case.
> >
> > OK, I suspected that might be the case.  I'll look at adjusting the
> > grep soon.  Accounting for per distro changes to the same package is
> > always fun.
> >
> > Thanks for the report.
> >
> > josh
>
> Terrific thanks.
>
> One alternative could be to look instead for support of  -j, which is
> what the script seems to want.
>
> Maybe something like:
>
>    parallel --help | grep -Fq -- '-j n'

Initially went with something like that, but decided to keep it simple
after review by just looking for 'gnu parallel' case insensitive.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/400

Will be in the next release.

josh
