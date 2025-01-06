Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1858DE77188
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Jan 2025 16:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD1CDC4CEE1; Mon,  6 Jan 2025 16:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9193CC4CED6
	for <linux-firmware@kernel.org>; Mon,  6 Jan 2025 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736181327;
	bh=rWGytJu8HiQoovQ6mmaJrYXz4U2SUb9M1S2k5avT9co=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=IrdnHH16is7c2LkNIiRQrzxQxEvdO9ElDkN8S4Kn0n6TAJzl38kSvS6qYteusau6O
	 B4R6Ly6CLXoyDTbwnBdUja9nOYyUuKpsPMN0dOnj1twBkYTpyNT2QodRMteaLBDukZ
	 MXFdWSfjN2a+b9i+lH+vbR6iDNbGyc57st/MJUf+AnpO4VDaaFoCMU0M2wFlU91zCH
	 TGisoOwTlEJ9avmiG/ekgen1TjQmhzOvwkSj9i2xI5OERRRNAu0vk13aw245CUhvhP
	 3/SZS6Dq9G7oRw/gxUIlbrbzNDnXr6Sf2Z2Y0VniXXNMLsLIuICDowjCG6D9aFFcpy
	 t6eoHG81DOQIQ==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e39f43344c5so18915982276.1
        for <linux-firmware@kernel.org>; Mon, 06 Jan 2025 08:35:27 -0800 (PST)
X-Gm-Message-State: AOJu0Ywx+uYyqFf6VOttpXe+u1Brsu+hyGlMvJPTzjHVdzlQxeLh74Om
	nHPBHHyxTRxmg1BTMZfjO+4pHEaJsLW0wbg/jMriH+rxVeSGkRV5vVhBLzf3sMH4Ieo6cy4x4iB
	oUpKLI5AgQG5UQIy+3AatpFMGl6I=
X-Google-Smtp-Source: AGHT+IHIIClUlo6PkKwafcDJLVU7RW8abCk7ytwkCi26W8rP0i4sUFYE4NxgAKoIQbz0on2vNYrOWQc31tH6pAg/80k=
X-Received: by 2002:a05:6902:108d:b0:e30:e39b:9d72 with SMTP id
 3f1490d57ef6-e538c256ae8mr44485731276.16.1736181326555; Mon, 06 Jan 2025
 08:35:26 -0800 (PST)
MIME-Version: 1.0
References: <1ba69d302cffb859053c38433e2fd47bf69eb1ba.camel@sapience.com>
 <CA+5PVA5HoXfRjPJ4kZ0_okDkOx-pvVhbMH_6QSfoJYCTQxB_3A@mail.gmail.com> <d86e6e6f50afee488d17a43979be6c8564f4e296.camel@sapience.com>
In-Reply-To: <d86e6e6f50afee488d17a43979be6c8564f4e296.camel@sapience.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 6 Jan 2025 11:35:15 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5eHh6uQM+7ecdK3QP2WQ=5Hd_qkn_GZ1By=mD7qiQqHA@mail.gmail.com>
Message-ID: <CA+5PVA5eHh6uQM+7ecdK3QP2WQ=5Hd_qkn_GZ1By=mD7qiQqHA@mail.gmail.com>
Subject: Re: copy-firmware.sh bug in has_gnu_parallel()
To: Genes Lists <lists@sapience.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 11:00=E2=80=AFAM Genes Lists <lists@sapience.com> wr=
ote:
>
> On Mon, 2025-01-06 at 08:02 -0500, Josh Boyer wrote:
> > When using programs that use GNU Parallel
>
> I checked the Arch build [1] and it has a patch to remove some
> "citations"  including the text you shared.
> That explains why its absent in my case.

OK, I suspected that might be the case.  I'll look at adjusting the
grep soon.  Accounting for per distro changes to the same package is
always fun.

Thanks for the report.

josh
