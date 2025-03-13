Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B78DC28B2E
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Mar 2025 11:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 501B1C4CEE5; Thu, 13 Mar 2025 11:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A65DC4AF09
	for <linux-firmware@kernel.org>; Thu, 13 Mar 2025 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741864689;
	bh=r/VzEAcVAiBL7JVXxOI4/4crMavtIQxjA2ZRiImHWus=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fR8ao2tp+AuU182y8einHDZbNj8/kyK6jFhc4EnsAq6x+NdvBZ4ntT7RJ3a00tbbF
	 7/kf6RjJZmoDCvA01aa4UYOx8MIFVWr5Y/9wBzHFGoNBA4/hXIfB62AXKFMup9CpVV
	 WIAix9mVUmFH64KTSQUIFe1GIA7TvDWpBHyrzyG8ia6IiWBD3Gp7q2C/Sd0SHV2urD
	 fE20V3N2V3o0PAJSKV4JZDsocxC1fo88k7vOdv8ZusPXCIzu0qsk1MdYLAK8AOh9Y2
	 2VKEX2lN1BF/V4EKw8VF/m/E1GkRl8DN/PjVHkflPIHQp8gpRQmka0JFkVxyzKzp6W
	 mqT4kTLL5PK7w==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e53a91756e5so817420276.1
        for <linux-firmware@kernel.org>; Thu, 13 Mar 2025 04:18:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZ/bhEEAasVMlahAu3RYrjhadu7fNRM+S0IKH64qh74GgWKFQwE30Em617j9BJY1d+Qz9EF4d6DgF+5QsEyg==@kernel.org
X-Gm-Message-State: AOJu0Yw9hOEqzs3PUDuSMzpDN1i59DAKT3cUXME5FV+o04pDF+S5oRSu
	kezXIfHJoQ4DFqxi/uXlDN7164bGGk7B+nNtnoGyVeYyxpyDRPCt0wi3g2CUNEV1/Fd0EI8okWa
	HON95FcqQ5AwsNx9CDNYJnv6jsmI=
X-Google-Smtp-Source: AGHT+IELcNGATH4W9KljJxNCGKZhRTXaJoFLZsHGuh6GROhiWMIyd0J6DhkjdIN9XQfXkab3h2I4VLcHeiWJlTv6pys=
X-Received: by 2002:a05:6902:1203:b0:e60:c3a5:3bd with SMTP id
 3f1490d57ef6-e63b520942cmr12322953276.36.1741864688425; Thu, 13 Mar 2025
 04:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250313051501.2519-1-zenmchen@gmail.com> <09b00f3c6d554ef0ab76065284eaf0ec@realtek.com>
In-Reply-To: <09b00f3c6d554ef0ab76065284eaf0ec@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 13 Mar 2025 07:17:57 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6bLg0xHgfEca8PvwxtWNyu1+d-z_ZexXNDXGa5vARaQw@mail.gmail.com>
X-Gm-Features: AQ5f1JqUQ4upDoDd_1ANEu0K8XnYfz-Y6IN9lK2-th7ogZFIwsLx5dlUj8Nf4dM
Message-ID: <CA+5PVA6bLg0xHgfEca8PvwxtWNyu1+d-z_ZexXNDXGa5vARaQw@mail.gmail.com>
Subject: Re: [PATCH] rtw88: Add firmware v33.6.0 for RTL8814AE/RTL8814AU
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Zenm Chen <zenmchen@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>, "usbwifi2024@gmail.com" <usbwifi2024@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 3:25=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Zenm Chen <zenmchen@gmail.com> wrote:
> > This file contains the firmware v33.6.0 for RTL8814AE/RTL8814AU and
> > was extracted from the vendor driver v5.8.5.1_35583.20191029 from
> > https://github.com/morrownr/8814au
> >
> > Signed-off-by: Zenm Chen <zenmchen@gmail.com>
>
> I have confirmed the content is identical to official release, so
>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Thank you.

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/481

josh
