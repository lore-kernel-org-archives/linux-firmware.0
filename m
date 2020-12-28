Return-Path: <SRS0=elN4=GA=tiksi.ru=kashcheyeu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8730BC433E0
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Dec 2020 17:36:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 52927229C5; Mon, 28 Dec 2020 17:36:48 +0000 (UTC)
X-Greylist: delayed 1719 seconds by postgrey-1.34 at mail.kernel.org; Mon, 28 Dec 2020 17:36:46 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 076D5221F0
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tiksi.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=kashcheyeu@tiksi.ru
Received: from eprove.net (eprove.net [194.182.82.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 076D5221F0
	for <linux-firmware@kernel.org>; Mon, 28 Dec 2020 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tiksi.ru;
	s=key0; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mvZOBp8Szw0c2sRAuUSCuKNX9jvOVrSKJL4g6gPbYaI=; b=4pIko2xUAoY67XqXMpIEXbIogR
	SemW+Qd+9HBH/nizCDODIVNVvb4Yo5Z8QPPu9Ask9T+iP/mhVZOqbalUfX7E5l6qAQG0+yESRaMbW
	NPzCYnnXYw75mvsIg0xY9XXgc80VfXelx/0dYWTIoShIpKkznnuFXGKyXbNCtUe+RowpVTlQElxze
	3BbVa3j9ZRz4yUM/otQXEFuoXUi3fDJKipfOvSGG5h4x61z1/QiQ4+Z19Pm9BlnhvxqYLmZazE4A1
	1U7mWLtUHv+S199m0MpXw3DpZ8vmJMZXc/1fTPRQ4TZcaheZvqiO9HQbQ3kN/gKazp2FLVHV2n06Q
	1gJKvxIw==;
Received: from [86.57.231.28] (helo=localhost)
	by eprove.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94 (FreeBSD))
	(envelope-from <kashcheyeu@tiksi.ru>)
	id 1ktw03-000GO4-KC; Mon, 28 Dec 2020 18:08:04 +0100
Date: Mon, 28 Dec 2020 20:07:56 +0300
From: <kashcheyeu@tiksi.ru>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: kashcheyeu@tiksi.ru
Subject: Realtek RTL8723BS and IEEE 802.11s
Message-ID: <20201228200756.461ffd32@tiksi.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uello37NuJ8U4tZaD=g=MnQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uello37NuJ8U4tZaD=g=MnQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Good afternoon. Could you add support for the IEEE 802.11s standard to the =
firmware of the Realtek rtl8723bs controller? This controller is often foun=
d in laptops, tablets, etc.

--Sig_/uello37NuJ8U4tZaD=g=MnQ
Content-Type: application/pgp-signature
Content-Description: Цифровая подпись OpenPGP

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQTcjc5aSRMU+mw5Kj4qqhHPlwmLGgUCX+oQ7AAKCRAqqhHPlwmL
GtXSAQDgS5IdJ/+03KbBNW1ZHXB7yJIBpTA/mFjwLQHs5hK6lQEA2hsQJm8y0vj5
y1HwogfCMlGTC0hO7fW8or9++2foSco=
=4XGI
-----END PGP SIGNATURE-----

--Sig_/uello37NuJ8U4tZaD=g=MnQ--
