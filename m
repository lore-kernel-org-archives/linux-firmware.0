Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C74E7717F
	for <linux-firmware@archiver.kernel.org>; Tue, 10 Dec 2024 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61B3CC4CEE1; Tue, 10 Dec 2024 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C689C4CEDD
	for <linux-firmware@kernel.org>; Tue, 10 Dec 2024 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733849623;
	bh=5lYjx2+BiRBIFjXnSo5svl82QeHj5jpE5gReq6hWD0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YEiJce1oWkMR/vzqVITdsL8HM+edDp/MyKrQuY0UCxTrxDxeiA+klYNCUwS4aNtb+
	 cNwIlU2N0KIjB9ARWeeBlzjwN1dWU3iFMczK+irOnJozgviyjmnICNPrNVgtLpK2My
	 FKeGtHsbAVoo43isMV6MIKS2EHCX84kTFc/jPfFk5mvoKB2zaMOb3H2P6TUJx+/tX7
	 kYatHt+Ngc3JUH80TuxWNgleyAARp359JILqQlEHZvA3twHHNQrMltokZOVXvfsJJa
	 NMrMtVuv7V/RSwBAuXNMcCcL6fLlIMwne80uN2EO8rr6iTMLzmSUm5Pcmduk90CSE8
	 lS44GoFGkRB1A==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6efe4324f96so37227017b3.1
        for <linux-firmware@kernel.org>; Tue, 10 Dec 2024 08:53:43 -0800 (PST)
X-Gm-Message-State: AOJu0Yy+fL02POEwJq9fg4Brxpo7+8zPHAwIpJ6JLBmJ0wIpiYcRFSwl
	dayetqeCE0fdsiUvUJJkUJFkioTVyLFLIsBEr7Vu0CPBT1ZLK4cSJOhO9j424hV892+3m2ShqRc
	A1JWN6kiQ0OmegF0lXXV4hG3N3uY=
X-Google-Smtp-Source: AGHT+IHwLNksWsooBAtcbd7Q2kLm9ZUsPE0d1kFQRm+3wSHqaaoz1xPG1nq+8UzcDQ+iLYJdhCh9A5unHnjlbFuei6c=
X-Received: by 2002:a0d:d387:0:b0:6f0:23da:49a3 with SMTP id
 00721157ae682-6f023da4b33mr43679607b3.8.1733849622551; Tue, 10 Dec 2024
 08:53:42 -0800 (PST)
MIME-Version: 1.0
References: <50a3038f-2a77-4576-ae83-aee68735f2c4@quicinc.com> <ea966b5f-d2c1-4b09-a4c2-e492d371e3ed@quicinc.com>
In-Reply-To: <ea966b5f-d2c1-4b09-a4c2-e492d371e3ed@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 10 Dec 2024 11:53:31 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6hQ6zPqG1ZEuGCEu+9Pz+CdN5uv3=RGDyVDKK7GJ_kuQ@mail.gmail.com>
Message-ID: <CA+5PVA6hQ6zPqG1ZEuGCEu+9Pz+CdN5uv3=RGDyVDKK7GJ_kuQ@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth WCN785x firmware to 2.0.0-00515-2
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 4:13=E2=80=AFAM quic_zijuhu <quic_zijuhu@quicinc.com=
> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a79=
43:
>
>   Merge branch 'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19
> +0000)
>
> are available in the git repository at:
>
>   https://github.com/zijun-hu/qca_btfw

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/386

josh

>
> for you to fetch changes up to 7f116580d9060feaedaed55eb65c63eeba59341f:
>
>   QCA: Add Bluetooth nvm files for WCN785x (2024-12-02 17:05:12 +0800)
>
> ----------------------------------------------------------------
> Zijun Hu (2):
>       QCA: Update Bluetooth WCN785x firmware to 2.0.0-00515-2
>       QCA: Add Bluetooth nvm files for WCN785x
