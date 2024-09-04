Return-Path: <SRS0=9Bhb=QC=puleglot.ru=puleglot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99AFCD4847
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Sep 2024 17:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7600C4CEC5; Wed,  4 Sep 2024 17:57:51 +0000 (UTC)
Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25C58C4CEC2;
	Wed,  4 Sep 2024 17:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25C58C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=Fvx3yxI69C5hXWu9OWAvVkhH6O8rTOFCPe1RTJrJsFo=; b=hBjCVNj7jlpwIaqD5NdQv6GLJr
	qHXYHPtPrZdkCOwSlPO5jTYSQYFEoFP9L7PNgLhY7Cs4dz5yLhNEfsW7fEFj6nTZRy3y4uz0unj8g
	UZbnyD8+XpPW9zGj6Lmp0AbAIpLMn2PPHD7wYdqwIDANWx8OZ3iwWxXxMeRsru52DVSA=;
Received: from [10.8.10.223]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1sluGE-00000003XPZ-3rlB;
	Wed, 04 Sep 2024 20:57:43 +0300
Message-ID: <cc0c058998c3e72bf6834987502cc7995b0abae0.camel@tsoy.me>
Subject: Re: [PATCH] rtl_bt: Update RTL8761B BT USB firmware to 0xDDD5_C761
From: Alexander Tsoy <alexander@tsoy.me>
To: Josh Boyer <jwboyer@kernel.org>, Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Date: Wed, 04 Sep 2024 20:57:25 +0300
In-Reply-To: <CA+5PVA7a6SQo1Uvj=oG_2_2QgY6jZ18B09z+wiXQ6J3g+XK7Vw@mail.gmail.com>
References: <20240904132742.2861526-1-alexander@tsoy.me>
	 <CA+5PVA7a6SQo1Uvj=oG_2_2QgY6jZ18B09z+wiXQ6J3g+XK7Vw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
Sender: puleglot@puleglot.ru

=D0=92 =D0=A1=D1=80, 04/09/2024 =D0=B2 10:48 -0400, Josh Boyer =D0=BF=D0=B8=
=D1=88=D0=B5=D1=82:
> On Wed, Sep 4, 2024 at 9:28=E2=80=AFAM Alexander Tsoy <alexander@tsoy.me>
> wrote:
> >=20
> > * Updates advertised BT version from 5.1 to 5.4
> > * Fixes compatibility with Xbox wireless controllers
> >=20
> > Release Version: 0xDDD5_C761
> >=20
> > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
>=20
> Apologies, but I don't recognize this address as a committer to this
> firmware.=C2=A0 Hilda, can I get an Acked-by or Signed-off-by from you fo=
r
> this update?
Yes, I understand that.

Hilda, please not that this firmware is taken from the Windows driver
package version 1.9.1051.3013. It fixes regression introduces by the
last commit that causes frequent disconnects for Xbox controllers as
reported in [1] and some other places. I'm sorry, I didn't find where
to report such problems. If this particular firmware is not
redistributable, would be nice if Realtek provide a fix is some other
way.

[1] https://github.com/atar-axis/xpadneo/issues/492
