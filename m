Return-Path: <SRS0=9TQq=ZX=debian.org=benh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0500C83F1B
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Jul 2025 13:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1628C4CEF5; Thu, 10 Jul 2025 13:49:40 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD81FC4CEE3
	for <linux-firmware@kernel.org>; Thu, 10 Jul 2025 13:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD81FC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t+ytJgWHvr9vwaQ0dLBlKRTx5d+Vvct1SSiKbB9ju1M=; b=C8KaQSXUWwGbPQ1WyfNiklGIM5
	MoWFPX3yUvQilgR4YB1a5NZaTSPxwsgeYYa+NZaC1qz9kK1WuenNwrR9fgIKinQixBsHVliJd0cu9
	vqOhxk/3d4507Bjgrw5M09vVGjBbL6yQmiEygvxH+r0E+kdtwq1CF3oFLuUudYgD5abr/a1eF3Amt
	04sc0VyWDvtKGwoXTesWyHl7YA+LmmvXN0P2cDEfvIMOF2iNxZ5Ti+xek+GRKh2bzWbFeleJN6Egh
	ffMzpVMlKWkq6psVchTLe0+0KYl7y+dyFd509O/ignaKiMI0nYAbp3yWZ5IUpb06lT9M8UDIX0ndp
	SFYnIC9g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <benh@debian.org>)
	id 1uZreU-00FOlU-JI; Thu, 10 Jul 2025 13:49:30 +0000
Message-ID: <d93218e8ac26a2ef52b70f6729b288a1cf67fef9.camel@debian.org>
Subject: Re: Bug#1109015: Wifi not working anymore with new atheros firmware
 from experimental
From: Ben Hutchings <benh@debian.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, Jeff Johnson <jjohnson@qti.qualcomm.com>
Cc: Bastian Venthur <venthur@debian.org>, 1109015@bugs.debian.org
Date: Thu, 10 Jul 2025 15:49:17 +0200
In-Reply-To: <c54be2cc-0df7-4f1d-8df5-0f2a63db924e@debian.org>
References: <175207470843.3858.4776386410784105622.reportbug@flix>
	 <626b97f83b392e50d726ea5fdeef45004d37053c.camel@decadent.org.uk>
	 <c54be2cc-0df7-4f1d-8df5-0f2a63db924e@debian.org>
Organization: Debian
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-g8TURZR1bg3AJopOsCl9"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-Debian-User: benh


--=-g8TURZR1bg3AJopOsCl9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Debian received a regression report for a recent update to the WCN7850:

On Wed, 2025-07-09 at 17:25 +0200, Bastian Venthur wrote:
[...]
> With latest update from atheros firmware, the wifi stopped working comple=
tely.
> I believe the relevant output for dmesg is:
>=20
> [   14.618942] ath12k_pci 0000:c2:00.0: BAR 0 [mem 0xb0600000-0xb07fffff =
64bit]: assigned
> [   14.618964] ath12k_pci 0000:c2:00.0: enabling device (0000 -> 0002)
> [   14.619469] ath12k_pci 0000:c2:00.0: MSI vectors: 16
> [   14.619473] ath12k_pci 0000:c2:00.0: Hardware name: wcn7850 hw2.0
> [   14.620039] ath12k_pci 0000:c2:00.0: firmware: failed to load ath12k/W=
CN7850/hw2.0/firmware-2.bin (-2)
> [   14.620050] ath12k_pci 0000:c2:00.0: firmware: failed to load ath12k/W=
CN7850/hw2.0/firmware-2.bin (-2)
> [   14.620055] ath12k_pci 0000:c2:00.0: firmware: failed to load ath12k/W=
CN7850/hw2.0/firmware-2.bin (-2)
> [   15.292124] ath12k_pci 0000:c2:00.0: chip_id 0x2 chip_family 0x4 board=
_id 0xff soc_id 0x40170200
> [   15.292133] ath12k_pci 0000:c2:00.0: fw_version 0x1108811c fw_build_ti=
mestamp 2025-05-17 00:21 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1=
.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> [   15.292494] ath12k_pci 0000:c2:00.0: invalid ACPI DSM TAS config size:=
 1
> [   15.292496] ath12k_pci 0000:c2:00.0: failed to get ACPI TAS config tab=
le: -22
> [   15.578459] ath12k_pci 0000:c2:00.0: ignore reset dev flags 0x212
> [   20.480632] ath12k_pci 0000:c2:00.0: failed to receive wmi unified rea=
dy event: -110
> [   20.481467] ath12k_pci 0000:c2:00.0: failed to start core: -110
> [   20.483870] ath12k_pci 0000:c2:00.0: qmi failed to send mode request, =
mode: 4, err =3D -5
> [   20.483872] ath12k_pci 0000:c2:00.0: qmi failed to send wlan mode off
[...]

(Debian applies a patch that adds the "firmware: failed to load" log
message but doesn't make any functional changes.)

The change was between 20250410 and 20250708, so I asked Bastian to also
test 20250509:

On Thu, 2025-07-10 at 13:51 +0200, Bastian Venthur wrote:
[...]
> 20250509 also does not work. Note, I simply updated the single
> firmware-atheros_20250509-1_all.deb and not firmware-nonfree etc so it=
=20
> did not trigger the initrd update. I don't know if this is relevant here=
=20
> so I mention it just in case.
[...]

So this points to:

commit 360fd45301707daa3d95be32d84132481b17db46
Author: Jeff Johnson <jjohnson@qti.qualcomm.com>
Date:   Thu Apr 24 13:03:30 2025 -0700
=20
    ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_=
V2.0_SILICONZ-3

Here is what lspci reports about the device:


> c2:00.0 Network controller [0280]: Qualcomm Technologies, Inc WCN785x Wi-=
Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] [17cb:1107] (rev 01)
>          Subsystem: Lenovo Device [17aa:e0e6]
>          Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParE=
rr- Stepping- SERR- FastB2B- DisINTx+
>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-=
 <TAbort- <MAbort- >SERR- <PERR- INTx-
>          Latency: 0
>          Interrupt: pin ? routed to IRQ 105
>          IOMMU group: 16
>          Region 0: Memory at b0600000 (64-bit, non-prefetchable) [size=3D=
2M]
>          Capabilities: <access denied>
>          Kernel driver in use: ath12k_pci
>          Kernel modules: ath12k

Ben.

--=20
Ben Hutchings - Debian developer, member of kernel, installer and LTS
teams

--=-g8TURZR1bg3AJopOsCl9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmhvxN0ACgkQ57/I7JWG
EQnP7BAAsC4QkkcSVw4wZBOngUuwllEzuSEgPF7qIZyU9pl4Up4FepyO9te/FUNI
PXbFjWmUpq+luJ/SGqm+IDNja7mJXL+BhtyzvLA27h8KLdbHHf11xk8uKq8IQ/ui
cigN7JQBXEBdaqae3wMhOHf+AbMAXoVS7kjkZmCYrSk4KfEX62GPAyDLvxioVZf7
Tck6Na32baUjLk0Gjkx6qfI1ym6cv4v2vFsfV2Yzzm8O/NU434kDbdr8xoRq38mL
9fWLU1gyK+BVPbgrbOObFOK1Ez3baH6OWL1Uh5HCKOJiGoS5hiMNQYnGFkU106iC
2rU5Dn2QA441RLNY5agCNlHorRG9TXI6Tq6+HtyJQIItY4D6fPrJopqe1EOC9Y11
1w7suMiCOniUxqR9hgQPxvuHpA162ibXTDsEzhnrCvZ8pecaVgSv2eJm6zNAE09D
p67DIbNJxAu6ddG17mP5H6PiOV5xyoOXgw9RwE8PKBTJ3WrpK1e9noLrv7x9KLGF
6/n6WW909ek78WmwEfRPLG6UPsJfj/SU0YPjrPr1dgX4KUBw39lONumZONMzpnPx
QfO/HBjg6pZBGnLKuOjqMTJWholjURaB3FcvTXDFArXOwRcNqc3lQWYQWm7nIwsB
o0oBc0UeNNYAxEEx+2i5T3QNL/Dz1uJrBzMi4kpWk/V3R+Sbfn8=
=Ib9+
-----END PGP SIGNATURE-----

--=-g8TURZR1bg3AJopOsCl9--
