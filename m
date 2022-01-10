Return-Path: <SRS0=SJRy=R2=coelho.fi=luca@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A992C433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Jan 2022 17:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A5BFC36AF2; Mon, 10 Jan 2022 17:36:11 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61487C36AE9;
	Mon, 10 Jan 2022 17:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61487C36AE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=coelho.fi
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=coelho.fi
Received: from 91-155-254-253.elisa-laajakaista.fi ([91.155.254.253] helo=[192.168.100.150])
	by farmhouse.coelho.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <luca@coelho.fi>)
	id 1n6yaP-001Zpv-Kf; Mon, 10 Jan 2022 19:36:02 +0200
Message-ID: <2aa6a2bb7efda2b9b322371211eff7a7d0aae706.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"kyle@infradead.org"
	 <kyle@infradead.org>, "jwboyer@kernel.org" <jwboyer@kernel.org>, 
	"ben@decadent.org.uk"
	 <ben@decadent.org.uk>, golan.ben.ami@intel.com, You-Sheng Yang
	 <vicamo.yang@canonical.com>, luca@coelho.fi
Date: Mon, 10 Jan 2022 19:36:00 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-dSlQ9WtmYm0owTBeLcgH"
User-Agent: Evolution 3.42.2-1 
MIME-Version: 1.0
Subject: pull request: iwlwifi firmware updates 2022-01-10 v2


--=-dSlQ9WtmYm0owTBeLcgH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This contains some new and updated firmwares for all our currently
maintained FW binaries.

In v2, I fixed the so/s0 issue in WHENCE.

Please pull or let me know if there are any issues.

--
Cheers,
Luca.


The following changes since commit 182a186c570baab3968ca9116ee58b1875fb0168=
:

  Merge branch 'for-upstream' of git://git.chelsio.net/pub/git/linux-firmwa=
re into main (2022-01-07 07:20:18 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git =
tags/iwlwifi-fw-2022-01-10-v2

for you to fetch changes up to 23e0197e9e6fe9ca0d2ead3a3df3c41df97ad16b:

  iwlwifi: add new FWs from core66-88 release (2022-01-10 19:30:31 +0200)

----------------------------------------------------------------
Update and add iwlwifi firmware binaries for release Core66-88

----------------------------------------------------------------
Luca Coelho (2):
      iwlwifi: update 9000-family firmwares to core66-88
      iwlwifi: add new FWs from core66-88 release

 WHENCE                            |  44 ++++++++++++++++++++++++++++++++++=
++++++++--
 iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1519264 -> 1519544 bytes
 iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1490096 -> 1490376 bytes
 iwlwifi-Qu-b0-hr-b0-68.ucode      | Bin 0 -> 1355836 bytes
 iwlwifi-Qu-b0-jf-b0-68.ucode      | Bin 0 -> 1275268 bytes
 iwlwifi-Qu-c0-hr-b0-68.ucode      | Bin 0 -> 1355852 bytes
 iwlwifi-Qu-c0-jf-b0-68.ucode      | Bin 0 -> 1275284 bytes
 iwlwifi-QuZ-a0-hr-b0-68.ucode     | Bin 0 -> 1355800 bytes
 iwlwifi-QuZ-a0-jf-b0-68.ucode     | Bin 0 -> 1275264 bytes
 iwlwifi-cc-a0-68.ucode            | Bin 0 -> 1314392 bytes
 iwlwifi-so-a0-gf-a0-68.ucode      | Bin 0 -> 1533812 bytes
 iwlwifi-so-a0-gf-a0.pnvm          | Bin 41804 -> 41808 bytes
 iwlwifi-so-a0-gf4-a0-68.ucode     | Bin 0 -> 1552216 bytes
 iwlwifi-so-a0-gf4-a0.pnvm         | Bin 21576 -> 21576 bytes
 iwlwifi-so-a0-hr-b0-68.ucode      | Bin 0 -> 1429192 bytes
 iwlwifi-so-a0-jf-b0-68.ucode      | Bin 0 -> 1378284 bytes
 iwlwifi-ty-a0-gf-a0-68.ucode      | Bin 0 -> 1494304 bytes
 iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41612 -> 41588 bytes
 18 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 iwlwifi-Qu-b0-hr-b0-68.ucode
 create mode 100644 iwlwifi-Qu-b0-jf-b0-68.ucode
 create mode 100644 iwlwifi-Qu-c0-hr-b0-68.ucode
 create mode 100644 iwlwifi-Qu-c0-jf-b0-68.ucode
 create mode 100644 iwlwifi-QuZ-a0-hr-b0-68.ucode
 create mode 100644 iwlwifi-QuZ-a0-jf-b0-68.ucode
 create mode 100644 iwlwifi-cc-a0-68.ucode
 create mode 100644 iwlwifi-so-a0-gf-a0-68.ucode
 create mode 100644 iwlwifi-so-a0-gf4-a0-68.ucode
 create mode 100644 iwlwifi-so-a0-hr-b0-68.ucode
 create mode 100644 iwlwifi-so-a0-jf-b0-68.ucode
 create mode 100644 iwlwifi-ty-a0-gf-a0-68.ucode


--=-dSlQ9WtmYm0owTBeLcgH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF3LNfgb2BPWm68smoUecoho8xfoFAmHcboAACgkQoUecoho8
xfqVtQ//V9+cGZiiaV011HItWyK8GTLDg7tOpNu0M05Ri3M3/RX/rPoDdDvdc923
5tB5KspSVLR8Dr14jid2BfJaT+aswNfxXzD7yb4w/8+jXJF5BkexuyBhXzy0rxkS
SCD1uZyhnLA7ujz/apXDCfR40oj2s0IYkC0ZHgR3MxW3YFTrQj6XA70yHJQkdgJM
/R/WkSPmEMhomrCTGGFiQbp18cWaD9uxxf7wvmTCJSH7A2k+OfWcyWxW8zZBjfRl
LlOGIHv6d3UNzSR3RRfeXPTKYJVRxjRa9nHPvJMqyOftyfKiWEoQ+xXAZyY7aVZZ
GXe1SrbY7Z91uRgzTwLmhdCz6kAwfG5oBXglnlOEIkielO25y8YaxzV7cwMgZiY6
Fwk0X/LW+kG4Zm05itiY5YTfqitr2VYbmjdEqvJIk93WwyqD5edZC1V9sl5MQKss
ve5EViZ0UHphLx4RZFtB8hwiMr2CbQ2vMADXcOVINXkcJlF/up6dTpZwj8QNTUca
rdYfOloScsQNaItfztrGVqHzh21hiKCAMhek9KILCHClyOeM/mgvQZ5m5OLGV5kN
TLpaiS9VZbD16JGyau3dlvoaeVcqR7QIW/hhhA21BkqhmGdmzd10+EunIZTvKbTo
Pwy6SnTsIYElvNU4ly20RO0MS1fhHespN45RWhTpawZ8nY8Sv+M=
=JMra
-----END PGP SIGNATURE-----

--=-dSlQ9WtmYm0owTBeLcgH--
