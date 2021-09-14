Return-Path: <SRS0=RMdH=OE=coelho.fi=luca@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3CCC433FE
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Sep 2021 08:19:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 25847610F9; Tue, 14 Sep 2021 08:19:41 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C854E60F24;
	Tue, 14 Sep 2021 08:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C854E60F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=coelho.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=coelho.fi
Received: from 91-156-6-193.elisa-laajakaista.fi ([91.156.6.193] helo=[192.168.100.150])
	by farmhouse.coelho.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <luca@coelho.fi>)
	id 1mQ3f9-000CZF-51; Tue, 14 Sep 2021 11:19:32 +0300
Message-ID: <cf74966169f716164a7e642edc1aae8cdb7417c6.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"kyle@infradead.org"
	 <kyle@infradead.org>, "jwboyer@kernel.org" <jwboyer@kernel.org>, 
	"ben@decadent.org.uk"
	 <ben@decadent.org.uk>, golan.ben.ami@intel.com
Date: Tue, 14 Sep 2021 11:19:29 +0300
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-OoVwIcVBLWdLW1vLW5NT"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Subject: pull request: iwlwifi firmware updates 2021-09-14
Message-ID: <20210914081929.WaxqO0jkUuL33Y-kurgLPoyYZWiUzTJgYBwdHEu7sfE@z>


--=-OoVwIcVBLWdLW1vLW5NT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


This pull request contains a single patch that adds firmware binaries
to support one more device family in iwlwifi, namely So SOCs with Gf,
Hr and Jf radio modules.  This replaces the previous patch that we
reverted.

Please pull or let me know if there are any issues.

--
Cheers,
Luca.


The following changes since commit 090a34dfe32bfe139bf0f8df96bcbce320ee8864=
:

  linux-firmware: add frimware for mediatek bluetooth chip (MT7922) (2021-0=
9-13 11:35:49 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git =
tags/iwlwifi-fw-2021-09-14

for you to fetch changes up to 22cfb96ad56e7c0fdee96550ce9612981dc8342d:

  iwlwifi: add FWs for new So device types with multiple RF modules (2021-0=
9-14 11:11:43 +0300)

----------------------------------------------------------------
Add iwlwifi firmware binaries for So with Gf, Hr and Jf.

----------------------------------------------------------------
Luca Coelho (1):
      iwlwifi: add FWs for new So device types with multiple RF modules

 WHENCE                       |  11 +++++++++++
 iwlwifi-so-a0-gf-a0-64.ucode | Bin 0 -> 1515812 bytes
 iwlwifi-so-a0-gf-a0.pnvm     | Bin 0 -> 41804 bytes
 iwlwifi-so-a0-hr-b0-64.ucode | Bin 0 -> 1427384 bytes
 iwlwifi-so-a0-jf-b0-64.ucode | Bin 0 -> 1365628 bytes
 5 files changed, 11 insertions(+)
 create mode 100644 iwlwifi-so-a0-gf-a0-64.ucode
 create mode 100644 iwlwifi-so-a0-gf-a0.pnvm
 create mode 100644 iwlwifi-so-a0-hr-b0-64.ucode
 create mode 100644 iwlwifi-so-a0-jf-b0-64.ucode


--=-OoVwIcVBLWdLW1vLW5NT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF3LNfgb2BPWm68smoUecoho8xfoFAmFAWxEACgkQoUecoho8
xfr5ZA/+PRZJ6+XpjDNBEdNWB8HWSpKc97BbiI9HiKmy9aG1KvUZhQt9VNHG2Ft3
a4Mlni3OialqZB9UkizrwEYlSb26ruVwk/I9o2O3FE6FXBLYHBfaH5ID9ouuqXHd
IQ4slsuwgZhFzji75/L+4xofewRbULX6AuC/6NzwoAcH9q8fdzWIXuHUjtswNjWs
5lHTuferSu6T3KbOxbR8kiLu5YST/NCj1jL1DJX+60EP1FsU4IzhySkEv0KyeOCg
VqTy4dhYX5WX2vcfd1jVHgAuYb+N+Qs4QVi+yRj3U1y04zws8u8rZ9HTI05sejm4
bt/B8zo8y8fZux6IiIwpfHSl0iO3o80igL1dysjojRgrAtDvR1zsWfKFyFKmndNx
JhdfKOUpLufU6JN6qIp8DfbK05XvYZ1NJ+VAIc8idqojJodcrZts10nBMfQHkciH
JmSE+CIijdIl3+x0gFuYCsA0uZX048x9uvoCbs+aMYJTjhw2olh84GFXqhE2kt7g
LP+o7DaSSLJ0HL7YLE4oHnFXIRLt53A640XM6Z5aNRpj7/V6f6CThcSWnYGQzCpr
EUEmGaYafrylp7L6JP87Ew/ogg99lctEuQ+/3ba/45yDMvmKf90QFJaeQSGhU1Ay
Bi1kkleayL0/Tl8/lx93rW1wHijYlY11WH1Con5qq9lEThQ1UmA=
=RRlp
-----END PGP SIGNATURE-----

--=-OoVwIcVBLWdLW1vLW5NT--

