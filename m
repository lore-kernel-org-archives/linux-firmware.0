Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CADCA1009
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Sep 2025 15:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 061F0C4CEF7; Wed,  3 Sep 2025 15:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4438C4AF0B
	for <linux-firmware@kernel.org>; Wed,  3 Sep 2025 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756913222;
	bh=2AoZxLqTf/A9zwOHwERbmiJUt5huFU+VyJwmsSco7og=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WvF21WWB8HEOTswp73w6jAMtEcI2Eby4G3iILDRvzbpc/FHNS/eArjy6EDbPZrS0k
	 Hx1W4QclDnmphq46tRKwKzza6RbdYsmgUXcESXWMpD20cGBgyKzXs/Gd2+sB4KN5/g
	 y1G67Y/+TMmzALia0xd865be6eNJpCoCoaxszZgaCqU5ynNhOpsNmaNCLC4NYew4AR
	 f2Sv3QXXaHihmXxlbow6XbVl1SNmXkIRUp/9nhfBPCS+U9kDE9N+V9YQBR99OsHxH/
	 cjnlz6Q79EVWEWXZa/zD30LNFuANool4svLlwX1jfyx7DfzNeFaU6TFZjBRqxSlFdX
	 5kgex78tG2+hQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-72485e14efbso323117b3.3
        for <linux-firmware@kernel.org>; Wed, 03 Sep 2025 08:27:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1HuknxybeBgayAsKJ6q6Ya+jeAkWXJqH9lYn176n98HhwQmlsoGOWEK/hiux3yVLSKB/KNywIoR4ESQwQYw==@kernel.org
X-Gm-Message-State: AOJu0YyJqJvMxpU8DndYJxZotZBBdFog+OO6Qwc6H2/KG42g1YX+lPua
	6n8EvROZgnsMxNEzx+odjJK9SKbGswviNhjDfRd5j8h4yqacjEYFGB9BjFyQ5q2IXUDpVKQZUwG
	BUPa442PkwkH8rkrt/A0+2bt4WA09AKY=
X-Google-Smtp-Source: AGHT+IHAyzxSlVte8bWkilqXBJKQiFNl0sBogsz+shBSysstR8W1gPv+zNeL9Y68cE1ARi7OiydLAcHRThGik6jWCKE=
X-Received: by 2002:a05:690c:6f8e:b0:71c:2173:51ae with SMTP id
 00721157ae682-72276537170mr178605847b3.39.1756913222149; Wed, 03 Sep 2025
 08:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <13e2d56d-6cca-3929-73a7-9faf83669759@quicinc.com> <x5e4zrb5yyuwwwhx3wfv7b3yj3qqubktbswpazzc2rpgan6i4s@ccy7ori3hada>
In-Reply-To: <x5e4zrb5yyuwwwhx3wfv7b3yj3qqubktbswpazzc2rpgan6i4s@ccy7ori3hada>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 3 Sep 2025 11:26:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA55SeU8shKp09Yk54kSfiPPx9DBaG+9Kfp3si2RY+sHhA@mail.gmail.com>
X-Gm-Features: Ac12FXyOuVqK1XrHcMGdbswScyT_qTVhZxNmZlJ-Ze_YAWJ2S6XQrxXlgPIoUvE
Message-ID: <CA+5PVA55SeU8shKp09Yk54kSfiPPx9DBaG+9Kfp3si2RY+sHhA@mail.gmail.com>
Subject: Re: update firmware binaries to fix encoder drain handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 6:28=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Sep 03, 2025 at 03:20:08PM +0530, Dikshita Agarwal wrote:
> > Hi,
> >
> > The following changes since commit c6aed39675756a72c9bce4d94f12d8feb983=
7950:
> >
> >   Merge branch 'superm1/revert-bd28704ab16eb880acbd38c597c54314e7745814=
'
> > into 'main' (2025-09-02 16:13:45 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > vpu.3.1-encoder-fixes
> >
> > for you to fetch changes up to 514c9017fcec5509bce5a575361e9b21badb54cf=
:
> >
> >   qcom: vpu: update firmware binaries to fix encoder drain handling
> > (2025-09-03 13:16:03 +0530)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/675

josh
