Return-Path: <SRS0=rzVf=H5=em266.yesdentallabs.com=bounces+59058931-d290-linux-firmware=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51912CA5FED
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Oct 2026 02:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0EE091F0089C; Wed,  7 Oct 2026 02:00:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=149.72.115.133
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791338421;
	b=VCjqE2+9MEvFy/Y/Tf94hK583rjVSTPGAGqatdSWNU2jPWLM60SbbId/6p4ozHvfymNe
	 JBuUPmxW86rNhFn7bgoxLyYEiGggn6qvsSVgdJau6gLxwtBlGk5G2XKiaeC+regb5kDok
	 SM4qXwounZPGw6v23u6Mlj7P64jPjrUiMfsgpeppFZuptpFD+8SBaskVlyFHIT2W6Buy0
	 KiX6NGwe9ZXEljewwPLobuSqgEL9t1RP9nmPGv4hEI2PtmLOccDD5vGUwzHmXFXhyFd6/
	 Jtoc5w4MKKAjxPQvmsn01ewR4Du/ZwOCkIKGEa9rt9VlCfM86HCUwRyWUXiK8coS+7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791338421;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:Date:From:
	 Mime-Version:Message-ID:Subject:Reply-To:X-SG-EID:X-SG-ID:List-Id:To:
	 X-Entity-ID:List-Unsubscribe:List-Unsubscribe-Post;
	bh=5JAvbWdVkzYjbPLrZ/rC6gXchNgXjBQ1Wve9AZqQAJs=;
	b=UmIZmwS6BKr8lSKG7NZK64y+Q20y5x+3K9OZv3VN5xM20Df5kvvrGQk/9zCFA+fKDrHa
	 AxZt31rnb4+KYpE1IA2w2EVsgqG4oXnepxAtiyjZvRKV+6DolUBLcWqXe+iPp5VRE/KWw
	 4nxBTv+w1+wnyhbNP+nBASR5/L8LepqxSaE+6TBO1MHYGpdn9DkG52M+A1/pw1eCO/ENq
	 AZ9Mg3zQS4VbnLEJJtwpUkJghqLrHPYhkU2NcTCLtlrgSOHFbtQ/oGAbvNN363nBTI9PY
	 sULSt6tkiJatQ9Sx0gob64J88bK3N5q6PaBQ7BYISgEZY0flopWpy8AfNhaIccxi+Aw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=yesdentallabs.com header.i=@yesdentallabs.com header.a=rsa-sha256 header.s=s1 header.b=hN0Iu42D;
	dmarc=pass header.from=yesdentallabs.com;
	spf=pass smtp.mailfrom=em266.yesdentallabs.com;
	arc=none smtp.remote-ip=149.72.115.133
Received: from s.wrqvtpvr.outbound-mail.sendgrid.net (s.wrqvtpvr.outbound-mail.sendgrid.net [149.72.115.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE4511F0089B
	for <linux-firmware@kernel.org>; Wed,  7 Oct 2026 02:00:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yesdentallabs.com header.i=@yesdentallabs.com header.a=rsa-sha256 header.s=s1 header.b=hN0Iu42D
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AE4511F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yesdentallabs.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=em266.yesdentallabs.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yesdentallabs.com;
	h=content-type:date:from:mime-version:subject:reply-to:to:
	list-unsubscribe:list-unsubscribe-post:cc:content-type:date:from:subject:to;
	s=s1; t=1791338417;
	bh=5JAvbWdVkzYjbPLrZ/rC6gXchNgXjBQ1Wve9AZqQAJs=;
	b=hN0Iu42Dw+YnxIuTGj+35hUQyWuhRN8/dhnah7m+cwLn4pp4Vbi4KdkbBIP+j+WQeUHF
	ySVVIQ/JtT5piBvQgZ6fOf+CmlJsol9MKqnQj02pnk6+F6tEOAzhmHgi2fCBuZK2FfmKkS
	5mwl6Fh4IaCz1UAPAgkqi+xF2xpJC9fsL/lj2NLzCN2Go/jF2o8cZELREG0xyB5kLKznC9
	ntbOemKkZVDL/4Fg/vXlGT8yz1OguGcGrVfTQC7Hmc4Jp40FvxXlu/CKvUGvFyuu9s5wnf
	diLtjYNfODobnoQSJt5qtgNw/brgJt3jyCxfoAWLTBGMEB67u7ad//8rsqw5xJBg==
Received: by recvd-76479b6d66-jsdnr with SMTP id recvd-76479b6d66-jsdnr-1-6AC5A7B0-AF
	2026-10-07 02:00:16.846497894 +0000 UTC m=+637155.498253912
Received: from NTkwNTg5MzE (unknown)
	by geopod-ismtpd-97 (SG) with HTTP
	id HWcuaaH_R9aGgG4GUspPhQ
	Wed, 07 Oct 2026 02:00:16.832 +0000 (UTC)
Content-Type: multipart/alternative; boundary=db5fbd9d26af1d1eed4ef5173e550f0795f08c96a4758c36d088d2da71b1
Date: Wed, 07 Oct 2026 02:00:17 +0000 (UTC)
From: Yes Dental <info@yesdentallabs.com>
Mime-Version: 1.0
Message-ID: <HWcuaaH_R9aGgG4GUspPhQ@geopod-ismtpd-97>
Subject: Your First 5 Dental CAD Designs - FREE
Reply-To: info@yesdentallabs.com
X-SG-EID: 
 =?us-ascii?Q?u001=2ED9JG1IRaFzlm5DLa6XIcKCh2iqWp=2FaK2ihRxYL6AC0eDhVdEit5S59CKv?=
 =?us-ascii?Q?mfkD0anPTS4DxyxijDSYp9kc5h4qaMseiBsWNOW?=
 =?us-ascii?Q?=2FZeLi53l+shikLhZQrhyb9LMTCbiWNEBSvG+XIA?=
 =?us-ascii?Q?cKcemBlJ6mP27NF64Pgi9Xtx4DD2puDjDvpntLP?=
 =?us-ascii?Q?ATDgjIkn6FpcHNCIazJB7HyzQms3EQZVZxF74Yi?=
 =?us-ascii?Q?tSiE3Tye=2F+xpZEpq+Kne9G6thDW5CqjDLaDy=2FGO?=
 =?us-ascii?Q?yQtq?=
X-SG-ID: 
 =?us-ascii?Q?u001=2EXwhBPNhCejkv4+fVosb2QVfR16Qxp9CrA7PjDe5zzeI=2F0IZCBsPXtgHbA?=
 =?us-ascii?Q?oGIj+RskLxA4N2rJjSWrHfgX07tLOm0v5BUQcd6?=
 =?us-ascii?Q?w3knjorGi7Hwu0WCOA5AFSvy0=2FwlG32=2F98FV2O0?=
 =?us-ascii?Q?9=2FIbb4kmkyuu+lrNHHjvmwNW7lQKPrEeH3wbZpy?=
 =?us-ascii?Q?8ekRIG4q67OVNq7UN8ZIbp1oXlcn2RQaP=2F9tr+J?=
 =?us-ascii?Q?pvif=2FLw16l+SCgs5DxrH6OoKlUTJVoPT7yYopEv?=
 =?us-ascii?Q?OZZaE2kYq1XtXIg5xZBmmHrvMgW2gS6nP5gzoHH?=
 =?us-ascii?Q?aIifJkThY04t+8jiSVzXaQa2T77CV38lsnRRLSW?=
 =?us-ascii?Q?HuPBXlzwnEvF58Q8quxf6istY40nKDjM9jVcojz?=
 =?us-ascii?Q?9zJIsLDpUPzCG00lAQdqD36KacewefD+O8ZIvGE?=
 =?us-ascii?Q?bdAXJc5kAgKNAbBOuSzAABUqtzuH7emviPk1HOI?=
 =?us-ascii?Q?jMC=2FKPapzmX4xyLxc3zRJIOTBbU8EXQF4th5=2FS=2F?=
 =?us-ascii?Q?4tfN1iykjNw0xwirL+U2T9rlJ9=2FN7xVBmNbfI1I?=
 =?us-ascii?Q?w2CamPywD+ILA9zMfIVngxX2Zf=2FiSoHzIpa6N1Q?=
 =?us-ascii?Q?SbmHGMhykIVok5FNgkOG1l9yNeg3Ch1Ou32ituk?=
 =?us-ascii?Q?qtth9hsAux7SBsf5H1xIupf5uiR5821unISG3al?=
 =?us-ascii?Q?ZCAguPqf=2FNLc=2FCWIhTDtlfj8mX6U3XzypRPqcMn?=
 =?us-ascii?Q?4ydLP2yow7ugnU+3dAeLBKB?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
X-Entity-ID: u001.lMWSawH7qQ8tlJfxFBSbpQ==
List-Unsubscribe: 
 =?us-ascii?Q?=3Chttps=3A=2F=2Fu59058931=2Ect=2Esendgrid=2Enet=2Flu=2Funsubscribe=3Foc=3Du001=2ETJDf?=
 =?us-ascii?Q?TG8rT1mNJ9gsVNdYiNeRLc4t82zVEe5JOAzQHeS?=
 =?us-ascii?Q?mMgi5K0VCagCgoM9MGdxjbgErq2xDCwGieuXPu7?=
 =?us-ascii?Q?ll=5FLJo1aa1gLQRJoKKP1gQquTlbDEFZ82lWYxTl?=
 =?us-ascii?Q?xnEuyBYyw01u17NADBPFnHw3ygWvD3YLvzFully?=
 =?us-ascii?Q?EdL2TNR9akACNYlIWrLxUC9wvQ1f9nHJjJLeRzH?=
 =?us-ascii?Q?0LZcHzR01xFIcb48T-tlp50vxXSal003Kah3vUF?=
 =?us-ascii?Q?pr3aFG6iqSC6Pv8GhkzYzqBBVP18z0dbSh7Mir0?=
 =?us-ascii?Q?ApOhSct=5FLBUSzvlPUPRsxPJyJT6wAoQFEH95Q11?=
 =?us-ascii?Q?wGULE8uTdq8N4s=5FHdkqc1tzTgVWmLNuoOX42mvD?=
 =?us-ascii?Q?MloXqXKHlCm3Kq4SppOvROD4AXIgsuIgeubHmYP?=
 =?us-ascii?Q?0NYjeJqFqveZ9ToS0rRnW6v2kff4kfngonynC-u?=
 =?us-ascii?Q?9aIqzhPV2pDc6xvX-V25HYw13rY0ghGOQEcqHm9?=
 =?us-ascii?Q?pQfiNQABa9zpf7to79OOzyQ4dMLUrMYWqiTdoZt?=
 =?us-ascii?Q?wFZ=5FJ-fFOsITrPTwwFUpYIOZ=5FrbmGEHd7lP2nxp?=
 =?us-ascii?Q?nhYm7XvZSrwVgZExVimQtOk5b-itdu6t=5Fc=5FLWZf?=
 =?us-ascii?Q?uQGn62EHo8=5Fdo0y5dB55WDLJaPvPUdpHlc2pjfC?=
 =?us-ascii?Q?b9YFTDKqlYT6xeKK8m7UKe9J-N-knmwMs7UJf0D?=
 =?us-ascii?Q?1MUVQHvzWkjz8Wt07rqRDEaxCR5pWrn=5FVWqb3fs?=
 =?us-ascii?Q?0LoQck-AKhe7SFfVp5ONqblpAOeR=5FoooBYUuAQT?=
 =?us-ascii?Q?jE06PMyxS4Enub8HtrSwfQVVFBs2jzvWIMblMbX?=
 =?us-ascii?Q?d7=5FePrFgyqoilmWiY-J3EWGPEVEULkgJy=5Fl0bEH?=
 =?us-ascii?Q?QLhz9ey-Pr=5FtEsX-6MqGM=5Fn-LS9S8Bk2oeJviqE?=
 =?us-ascii?Q?gO12B9M3uYANoVsSJarMXlRlYr6yghVtpHWykmD?=
 =?us-ascii?Q?xQwlpJpHZotQELpQpbDqLqqfrKcdpEYrG8ZNGTu?=
 =?us-ascii?Q?RumdoHmnhKNaNHFc-BgoobCpjvLMW7x4VOIt-nc?=
 =?us-ascii?Q?rzZ3-RogJ3N4SKatKk=5FElM7WZRLwJJq0qZfkpqy?=
 =?us-ascii?Q?h809chhsC3xvXUWLJpAdOSxvufVTYyV9Ya1x5hk?=
 =?us-ascii?Q?UEO3tnoJClTK7K=5FR1hvNXUz7lY3a9415NyTtoU2?=
 =?us-ascii?Q?L61k364CtCPVQlruGY3vj7uPAFTxbw50uI7ZlU=5F?=
 =?us-ascii?Q?cug6myZ5vSmE9Sgo0Y101JnmrBbeRR=5F6JqpHvA8?=
 =?us-ascii?Q?LCdTykAaT-NTMwZfx42UNgJrPFtU2lGLRe0D=5FwJ?=
 =?us-ascii?Q?xUZe26ORJKWoOoByXCmje8aC-nlbS9UmC1wQzl5?=
 =?us-ascii?Q?VeKCKaJrwLgdZmwJmyJq3NbwqcgaGxROIKGpD2g?=
 =?us-ascii?Q?5TK6w5ZDE6jxOfcTCrKvWxbcL3m0czjEHkbSyS8?=
 =?us-ascii?Q?YmuN6eQnLtHRPT4tm9YuSkaliCeROJmdwGIqNBi?=
 =?us-ascii?Q?ZuOsrk9bxcslguWj8kHTspce2t2J8qRueJ88z3I?=
 =?us-ascii?Q?UUhBEHfQr8W78B06qMSqK8ggnx4BW7IobXb0miU?=
 =?us-ascii?Q?DFpwZkgy2=5FNC2C9KpP3FTOHFHHCu5zK-mn1fVGq?=
 =?us-ascii?Q?KTc5vAb1kJPzkmlfD=5FFO0oV2AkEum42QjKrNmAZ?=
 =?us-ascii?Q?nOmBLrV=5FUGR=5Fh5Jb=5F4vK0UoSdjR0DAUpgYn-ySd?=
 =?us-ascii?Q?pAfciTrJXv5hspGwoACJf1uL3IgtrLPYfxzI=3E=2C=3C?=
 =?us-ascii?Q?mailto=3Aunsubscribe=40em266=2Eyesdentallabs=2E?=
 =?us-ascii?Q?com=3Fsubject=3D59058931=2Ei4D3jnQv-qavGZtmPe?=
 =?us-ascii?Q?mBBsms81UMB8tkMX9pIBB1IshoMDAwdTAwMLrct?=
 =?us-ascii?Q?hbYv=5FSy3KGPRihVJH4kEROLrWVrmg4Lehzwqke4?=
 =?us-ascii?Q?4JIWW7Ycgc=5FgmZQ=5FCZgNQtvTazz8aDTviTaDQ3b?=
 =?us-ascii?Q?pTMTlqXoe3xEGTjdcEbbOf5QsHgHNWKT2kTV-0N?=
 =?us-ascii?Q?cWB5zf0A=3D=3D=2EHcgptoLEnUt1JRbPYggwr4oRdxRv?=
 =?us-ascii?Q?H2QjS=5FLXwSVKkJloMDAwdTAwMOYMn=5FZaCRxzpYn?=
 =?us-ascii?Q?5RPZsb-1qHZhzD8reklJa4gAvmPXR5gl2ogmIo7?=
 =?us-ascii?Q?6yjRKE06PiFaWmlCr4xv3sGcJBD=5FnYE4x1CNUz9?=
 =?us-ascii?Q?yKF8ziS7SmY8TInaBiuGA1yBdTZcIhEbGz686I-?=
 =?us-ascii?Q?4fWQae1qgbK5XGZMf2d8Y4YpL-hKtw-na2bkaip?=
 =?us-ascii?Q?SFkHLkJTtbdFFAUZzJq7IHQbsXcdVQ8kOwyZhPe?=
 =?us-ascii?Q?zIOsgIdtMiVnviosSCiVYlFOP=5FE9BYysgbdAfR-?=
 =?us-ascii?Q?GeDb4vThhceFBzXeKrPVbhLNlsmmv4RYU3xl5Wt?=
 =?us-ascii?Q?ykCDmcZRVyEw1wI-YWKC9SJ6CNccejor4Fqlifk?=
 =?us-ascii?Q?5JXZDnYU3AqhzE60wEqfcLa5pkT4Beqs0bQXiK3?=
 =?us-ascii?Q?ol4FQJdlFYS1QSVzaN6F1ypESQbicvbf9zvc48E?=
 =?us-ascii?Q?VB7pmiqsuA9UD1h4l8=5FfR2vdiZoa1u7E6U2=5FbP6?=
 =?us-ascii?Q?-rl-raHbdTQvbKRSBGh-s31v8=5F5DnUUe-NS0fDb?=
 =?us-ascii?Q?1duGv9e6DS3fsDTCBJtx9m0UBfvwinEJw-sG4jf?=
 =?us-ascii?Q?nsEMvrBjqPEnNOlnwVatKQzrDbvzxiXF7-OntJh?=
 =?us-ascii?Q?P5uxMtU1WdJyHeAd-JADv-BT-FTx3gAjZEV2tkv?=
 =?us-ascii?Q?wx0OLV7iRNTq3bPJtIagBJBAC5OnWWaun4ppo53?=
 =?us-ascii?Q?ckIFA6xAZwkwbbeonLAhu4KwP93kNnPbDGHLn5z?=
 =?us-ascii?Q?MSa-ccGdWwKROQgZNG=5Fe8MbqoGmNIvpeOn85OHo?=
 =?us-ascii?Q?Io-1omXwbQyRO5-5f5Jy=5FHRYxVbjRpwiZ2lKmmq?=
 =?us-ascii?Q?aSsuRWxSdT6VwPYTwZxIWq72Euh-0WQbhp6RX-D?=
 =?us-ascii?Q?jMTtnR3hn3DAkZ2lry9022bLsiXbHSkkK0bl18D?=
 =?us-ascii?Q?FSbgG4iBLKb9SCTwYeioSw2uys=5F5kep3goJzqfw?=
 =?us-ascii?Q?LJUF2m0DMV5txKepYrQ2p8Mqg=3D=3D=3E?=
List-Unsubscribe-Post: List-Unsubscribe=One-Click

--db5fbd9d26af1d1eed4ef5173e550f0795f08c96a4758c36d088d2da71b1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0

( https://www.yesdentallabs.com/en/?utm_source=3Dsendgrid&utm_medium=3Demai=
l&utm_campaign=3Dusa_dentist_outreach_campaign_01&utm_content=3Dheader_logo=
 )

*Dear Doctor,*

Looking for reliable dental CAD design support?

Special Introduction Offer

YOUR FIRST 5 CAD DESIGNS

FREE

Experience our quality, turnaround time and digital workflow with your firs=
t 5 designs free.

YES Dental provides digital CAD design support for dental clinics and labor=
atories internationally, helping dental professionals manage their cases wi=
th *reliable quality, fast turnaround and a smooth digital workflow.*

Our CAD team is *trained by German dental technicians* and follows *German =
quality standards* , with more than *25,000 successfully completed designs.=
*

SEND YOUR FIRST CASE ( https://caseflow.yesdentallabs.com/signup?utm_source=
=3Dsendgrid&utm_medium=3Demail&utm_campaign=3Dusa_dentist_outreach_campaign=
_01&utm_content=3Dsend_first_case )

Why Dental Professionals Choose YES Dental

=E2=9C=93 German quality standards
=E2=9C=93 25,000+ successfully completed designs
=E2=9C=93 Fast and reliable turnaround
=E2=9C=93 Overnight CAD support
=E2=9C=93 Easy digital case submission

Our CAD Design Services

=E2=80=A2 Crowns & Bridges
=E2=80=A2 Implant Restorations
=E2=80=A2 All-on-X / Full Arch
=E2=80=A2 Abutments
=E2=80=A2 Removable Restorations
=E2=80=A2 Night Guards

Ready to Experience YES Dental?

Send us your first case and experience our *quality, turnaround time and di=
gital workflow* with your *first 5 designs completely free.*

*Not ready to send a case yet?*

CHAT ON WHATSAPP ( https://wa.me/919599144175?text=3DHello%20YES%20Dental%2=
C%20I%E2%80%99m%20interested%20in%20your%20Dental%20Design%20Services.%20I%=
20would%20like%20to%20know%20more%20about%20your%20CAD%20design%20solutions=
. )
BOOK A QUICK CALL ( https://calendar.app.google/5i3p6nV6twTgf4R2A )

We'd be happy to discuss how *YES Dental* can support your dental CAD requi=
rements.

*Best regards,*
*YES Dental*

=E2=9C=89=EF=B8=8F *info@yesdentallabs.com ( info@yesdentallabs.com )*

=F0=9F=8C=90 *www.yesdentallabs.com ( https://www.yesdentallabs.com/en/?utm=
_source=3Dsendgrid&utm_medium=3Demail&utm_campaign=3Dusa_dentist_outreach_c=
ampaign_01&utm_content=3Dfooter_website )*

=C2=A9 YES Dental =E2=80=93 Design Center

You are receiving this email because we believe our dental CAD design servi=
ces may be relevant to your clinic.

Unsubscribe ( https://u59058931.ct.sendgrid.net/asm/unsubscribe/?user_id=3D=
59058931&data=3DXLIP2hBY_Fg0PGFOvgxwrUU2PE1o4KE1ZxWXhz0Dbx1oMDAwdTAwMA5eV0P=
d0L5BRLfrh7r06vpzgS_4ci7WO_2gl_SoObS1sFd8HPRsfoKgwlIeJpUgO74vYRFLt-cvmzHnPu=
ip9rnBQ_x1PT_ERv8aeA_YMVaHwJ7RLihidDLot5IOY4X0uHgtrSITiUFFU-YAbZQWPvh998Cux=
0HkVUsjIM1qYDGFrttbpNLwp65klvow4J3GnRQOQcsezU5d7CQHZvEiszltbt3E8cilbatzR-dC=
_c2XtNTWY9ogqJER3Ero0obeyoOrAxFPDzEBSeHA5DZUQ7x8kHHTBj3lBtLxfe563qgTN7yEK8u=
LMGneiQfJ-8-wcJyErWkzwJ4tZ4CAAsRWCqcdh1PximwSMBZQ1wTnae4zTYizJ_HrwAEy8813Xf=
un2vArRQLjBYOj2QcoOnbujbGo7--83hughyReurataCwxPRP8QozFXbZEynprz1dDnwzitYQZc=
H_RRbmDG2dGVnTkjwgisU7uIvbdpuj0VL2IzjYCnM3oD8maagwuu_KndTaJlyywAgW2NkPiKRCV=
O2dvtuqL2jjaJkQ7C3gfvgo2_wU-AISYc67pzj8Is5EEHdxtoOUr_Y20QK0BYxK3IQPJ-NVlji5=
xt5byduwmLrvqhVTtXmTlvlksI8dN9hbPGhHOvypwpdRcqPmLsEv4zAA0qhLZeaRQ3LnUsrXg_F=
mpxNqOkH7TvL_Qh-wjSWwDRpi1YP_BWTTJw2ZdSHHkQkGYFLR3pvRCWt7x9FFnZ6Cx6-A4PLCbF=
K30PuvW26nsjttD3eCfI1dRQKysuUBSwXiJfAnubKdR7OaG5tUiWjzMMevHXEOfjfVrQ2Dqc-Cf=
1Ejf1rCxjapxdadGnrIartatU82shLzNDe30nPCEYfF3nXyhPFVKUBsr7zjQeFN7gT_P8zd5TNm=
Od0fLF5wo1z9ooyBpqU3v1HYtqwvLLMuQOsK6QRFOzaMVyV9PPf1mkxE37VAorH-iDnVVoha2RT=
gkX1efz7NYFU6TTGbPST8YYQUIluDy05hZdGq3hjjdKlSRrMjIpIvrPj9CPat8saMMdEmLhCqJl=
lFmEd84bs9X ) | Unsubscribe Preferences ( https://u59058931.ct.sendgrid.net=
/asm/?user_id=3D59058931&data=3DzhhJn7uqoSN_epMqsxWHpoj0-Yq21YUKBawPMbT5DfF=
oMDAwdTAwMN_H-Xzd8JfEs6Bm29rH3vl8xb-CXjGLX4uz9jV8a9PiWc270xrBMVyNV5IBE5DH2W=
KXzKpspDh8GojyahIMxlR5udjKKlPoEOptFkWtpCmhTUzoIubyLitwFwfNe-GNgjIKzNo6LC66f=
NSe1WRRb0JPq0g6IbOSG8TXleBRxtwrOybrrsKks0DhFdRTBCPNilsTwOsM7N5SiVfo0V1nQvUE=
w6qo_857uRTPtMLK-nw_6v-2S9bKLR36Kj2xa4a87uJnL6DEklUY1Mwnx3ORsJS1sVDn3DV9GsH=
zGLXgDPQ-JBuEr39nN7cB6vonJ0xX5IyXJ1BreI4EF1VyEkLPeVyQq6G021FbOvG6-GiMBJYOKg=
VDFSrlwitdgJ5RKenicOdjo9hYUKH19upbuf7tIssk03pxPlO5KLFZ5r36ui0Z_U9T-WpbliMXn=
TJ4tIwJkODK5_he7c8rlkFsU6kFuMlnevLfJlMPROtiXbz-LCJhBgGvVR5f3Nhv_js4OitA798-=
IlU71v80N1x0_a621kz4J6Pfv7d0Yt8be4_5WybCxX8z8XdLMHzrG17k1HclQmVC5_zBv_pHddB=
WeuWXl6k-LE5K6zj109XtKqPcmkrs1tzlG9DKrnosQJocybG1_DKSTu_GHIPYu71c4wVAeRDA-n=
kMuHYLUtwORwaSCTkDBHCVKylNDXYiSfIGGTUOEWhySHl57YhXy834InmEKs3zFuSZ_vBlQOXPP=
2kr1vYQaFpHuCMO6_74waBY5VSf2_poB36yN5IRg4AowwjWHjgPkOioTa6j9kH1S8qPFR09g8td=
VKBxF4pepKJKMuPkUe2RVJDAtts42nktZ_lUGPhpkA3ATzrXuCSDguW6Bl8pD9vlTa8xuGrWQ-Y=
6nGQ6tOMOJ2xdZCfD4_-dx-vAb5jJ7zHvO79uD_EOzUFD6ArMjLhaC3Iuy8vHsfW8kWnQ-i4MLv=
H4_a8dLOs7ChusCPn0Fv-S534PKzR-YcztSISkoVBltoJFbm9fXZYTTEVg3Itg3mteIlUjkMg9V=
OGrstSPgyYLHsgVUp93pF9Ny_eN )
--db5fbd9d26af1d1eed4ef5173e550f0795f08c96a4758c36d088d2da71b1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8
Mime-Version: 1.0

<!DOCTYPE html>
<html lang=3D"en">

<head>
  <meta charset=3D"UTF-8">
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1.0">
  <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">

  <title>YES Dental =E2=80=93 Your First 5 CAD Designs Free</title>

  <style>

    body {
      margin: 0;
      padding: 0;
      background-color: #f5f7fa;
      font-family: Arial, Helvetica, sans-serif;
      color: #222222;
    }

    table {
      border-spacing: 0;
      border-collapse: collapse;
    }

    img {
      border: 0;
      display: block;
      max-width: 100%;
      height: auto;
    }

    a {
      text-decoration: none;
    }

    .email-container {
      width: 100%;
      max-width: 680px;
      margin: 0 auto;
      background-color: #ffffff;
    }

    .content {
      padding: 32px 40px;
    }

    .heading {
      font-size: 25px;
      line-height: 34px;
      font-weight: 700;
      color: #163d63;
      margin: 0 0 16px 0;
    }

    .sub-heading {
      font-size: 20px;
      line-height: 28px;
      font-weight: 700;
      color: #163d63;
      margin: 28px 0 14px 0;
    }

    .body-text {
      font-size: 15px;
      line-height: 24px;
      color: #333333;
      margin: 0 0 16px 0;
    }

    .benefit {
      font-size: 15px;
      line-height: 25px;
      color: #333333;
      padding: 3px 0;
    }

    .service {
      font-size: 15px;
      line-height: 25px;
      color: #333333;
      padding: 3px 0;
    }

    /* Main Offer */

    .offer-box {
      background-color: #f1f7fc;
      border: 1px solid #d5e5f0;
      border-left: 5px solid #163d63;
      padding: 24px 24px;
      margin: 22px 0;
      text-align: center;
    }

    .offer-small {
      font-size: 13px;
      line-height: 20px;
      font-weight: 700;
      color: #163d63;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: 5px;
    }

    .offer-title {
      font-size: 26px;
      line-height: 32px;
      font-weight: 700;
      color: #163d63;
      margin: 0 0 8px 0;
    }

    .offer-text {
      font-size: 15px;
      line-height: 24px;
      color: #333333;
      margin: 0;
    }

    /* Primary CTA */

    .primary-button-wrapper {
      text-align: center;
      padding: 8px 0 20px 0;
    }

    .primary-button {
      display: inline-block;
      background-color: #163d63;
      color: #ffffff !important;
      font-size: 16px;
      font-weight: 700;
      padding: 15px 34px;
      border-radius: 5px;
      text-align: center;
      min-width: 230px;
    }

    /* Secondary Buttons */

    .secondary-button-wrapper {
      text-align: center;
      padding: 6px 0;
    }

    .secondary-button {
      display: inline-block;
      font-size: 14px;
      font-weight: 700;
      padding: 12px 24px;
      border-radius: 5px;
      text-align: center;
      min-width: 180px;
      margin: 4px;
    }

    .whatsapp-button {
      background-color: #25D366;
      color: #ffffff !important;
    }

    .calendar-button {
      background-color: #ffffff;
      border: 1px solid #163d63;
      color: #163d63 !important;
    }

    /* CTA Text */

    .cta-note {
      font-size: 14px;
      line-height: 22px;
      color: #666666;
      text-align: center;
      margin: 4px 0 12px 0;
    }

    /* Footer */

    .footer {
      background-color: #163d63;
      padding: 22px 30px;
      text-align: center;
    }

    .footer-text {
      font-size: 12px;
      line-height: 20px;
      color: #ffffff;
      margin: 0;
    }

    .unsubscribe {
      color: #ffffff !important;
      text-decoration: underline !important;
    }

    /* Mobile */

    @media screen and (max-width: 600px) {

      .content {
        padding: 25px 20px !important;
      }

      .heading {
        font-size: 22px !important;
        line-height: 30px !important;
      }

      .sub-heading {
        font-size: 18px !important;
        line-height: 25px !important;
      }

      .body-text,
      .benefit,
      .service {
        font-size: 14px !important;
        line-height: 23px !important;
      }

      .offer-box {
        padding: 20px 15px !important;
      }

      .offer-title {
        font-size: 23px !important;
        line-height: 30px !important;
      }

      .primary-button {
        display: block !important;
        width: auto !important;
        min-width: 0 !important;
        margin: 0 auto !important;
      }

      .secondary-button {
        display: block !important;
        width: auto !important;
        min-width: 0 !important;
        margin: 8px auto !important;
      }

    }

  </style>

</head>


<body><img src=3D"https://u59058931.ct.sendgrid.net/wf/open?upn=3Du001.1UC-=
2FG1r4q2F7W-2BfmxQXtFY8PR56g3aMsFDDO4-2FL-2FOLCER0pqLVK1b6Ngi6uwa5S1jNb-2FV=
RERr2RomskZ-2BadcNPfCszgKLP3Fl7U9DxTyPvHx9MmO1gucbg4g-2BPIJ0j59wmYq5N8z0ufN=
pKkJx9FSDalRnwp46B-2Fe0KUc-2Ff0ytmQdB0-2BGUqlbZWIQGwdQOhFc9cpX0ZT2W1iLtYB9t=
-2B3o4uTCFHgXQW1sBFGL4Dw1bn54SzOyAPur01dERl6bF-2Bl0AnFZ2WeQ4IwOsrylZXsLLFeZ=
Zl2WjUAqieBvJpgX6UqCOOq-2FSdipGLyaLFXgr0hV2LPWwTWNbvGb86wXXlP1LcXQ0q3NOpY0P=
ZqnpFNViWVqbmZVBhBAigfdxsXItomOHlhsaxaPd5VhE5KKmjqFTG-2FsoXZxqT4DOSAnVkHKu8=
XBbBONMtmTz79NBJa4IsT0XW-2FVxxkSuA4Y26M0MxwhVk0KSy-2BtrRzhCbIcdlcHrZddKxe1R=
bbCwR6X3Cw-2Bo0XhctLDcH3kEHRkDXfGRb4HJIsqeHCHzeE1udOdGdkmTVAulXu9mwEATVIzFr=
nB1OFSDAyGcaZofdMDo6WsPbsVxkgrZO751vjJiQKJFmk2265uWNooCewIvNBO1cEU56JQ75Ywp=
FpgshIqmmhdW0rhKGJfKlTSCPZPpNdSJxFlzu7oSHN8uNtHQFVZYl4Z73FrYdyMb-2FDc6sgfBc=
EhfOQh4XkhpOdJJ7dpF1LTOGhnOlPCpkZ9yp6MHRICd0hSpZP-2B1c1EvIiujjqHfcvU-2FY3r5=
kSdND1GqC-2FkLJ0a0-2FFYjNz9gV6jtI0AQT60RItU23ExSIre9Tp34i6PH-2FaqpOpthgVpAD=
O5kCJSfpqjZeai1Yah-2BixKO1pX3vzEkNAc2DFOF1z-2Bq94DOiuZcMeykk2f-2BLBG0e6hZBq=
PFT9oJkw-2F-2FWQ-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=
=3D"height:1px !important;width:1px !important;border-width:0 !important;ma=
rgin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;=
margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !importa=
nt;padding-right:0 !important;padding-left:0 !important;"/>

  <!-- Main Background -->

  <table
    width=3D"100%"
    role=3D"presentation"
    cellpadding=3D"0"
    cellspacing=3D"0"
    border=3D"0"
  >

    <tr>

      <td
        align=3D"center"
        style=3D"padding:20px 10px;"
      >

        <!-- Email Container -->

        <table
          class=3D"email-container"
          width=3D"680"
          role=3D"presentation"
          cellpadding=3D"0"
          cellspacing=3D"0"
          border=3D"0"
        >


          <!-- Header Image -->

          <tr>

            <td>

              <a
                href=3D"https://u59058931.ct.sendgrid.net/ls/click?upn=3Du0=
01.WDpxVHq0KFIUzSnNtAF6-2B-2B8rwy9LovmH-2BdSt-2BtSgX5rwoJr5YV1C2mR-2FHE9le1=
RPrmO-2BRibj8CcpHakC9q3-2F0ZD0z3hdwt8C-2F2Ir0KJjmXhYJDLPLwpuzDKvVP20BpLAbnp=
KChRoynITC8Kg-2B96Q7D9DSq7IXqXnrv502QdcDIP8531GEEqQOc9bipTES08O8rrpSjHIGu1i=
Jr0rwbLiHg-3D-3DhOgC_b-2Fb9pt9xKHnxuD6lw99EEuSb7yotTbfa1gsj17M5wGLHEOe-2Fe5=
zikHNEyCpBBACN6Oi70T8OSScX9BVyyKJWXilRv5iEZWeTnT8s0niViTtZqjpC-2Fx8gAx-2FfC=
YvqzpJOvKfzf8Dq4T4G52d-2BHVTYyilXPnTb4w9LU9P-2FnGNDRhB3vRvrVfaAPj1LvpY2h-2F=
vaJULyR8iD7yknA2gFKExUlokMsdLEzMWOuwvCFN3T0QCSqQTK9d2CIjJVl-2F97EK5-2FA3x75=
3-2BfJFf1AFKTXNrp3eog-2BRT5Bj29oHrwwsGPcCdzUcwryqGx54m0gRqWoyYyv1qSC-2FVqMd=
OOKcD1wEvt7LXD0ANXPTmi9RfpB9fX2HSUmmGqEwRzx2IYnH4-2BUp5qZ5PWkGUenf-2FA-2BKQ=
LtLLi5wHCxGBfEKpHaD7fea7hU0JzwL-2Buk95C-2FklC-2F1cP-2BnQU-2FFBbwcuJpmHTUJzZ=
xmaQzOh1b8tVj7RuR1pN0PhKoDtvZez-2BQKgq2CsS9Xy4RxHwYGFbioyOUxsSivBTMhTayNB2Z=
LE-2B-2FRTnHtGirfKv-2FqVZQQPE-2FZLhuG1YTZzsZpBGKvzzuYnQruVJmlA9fcVFntZTHOw3=
uqLMnI3dL1Zsx9YsDHV43tIKn5eWr54XXZD8SdZRNSi5mq24bypPLaxoKPlqqkHiuYuVq7LjpUM=
FDrYrXv-2BD1BapJOmaCJa05TDEpQ9fEI3meTBKiAQD3yoy0f00yltdG0tdeWeiqpidgzpqIxLC=
2zaRcZ0Ygqb3AgBNF1ADC6abTAkIRgEuSsjJj-2FIjtRRTmfMrr5mAN3dnewpl8xhmxiE3S4kw-=
2BCUAprTeqad1tFcC7C3u2YuFgscg5GUWkcypG1RmgOkJZHohRP1gElr9fXL6VS7R2kxNzco6gX=
mIjGvac1pEmW-2F0vG5wbA-3D-3D"
                target=3D"_blank"
              >

                <img
                  src=3D"https://cdn.mcauto-images-production.sendgrid.net/=
30ff3309027af384/6c52300f-0797-4494-b4c7-8e8f65e452ff/879x388.png"
                  width=3D"680"
                  alt=3D"YES Dental =E2=80=93 Dental CAD Design Services"
                  style=3D"width:100%;max-width:680px;height:auto;"
                >

              </a>

            </td>

          </tr>


          <!-- Main Content -->

          <tr>

            <td class=3D"content">


              <!-- Greeting -->

              <p class=3D"body-text">

                <strong>Dear Doctor,</strong>

              </p>


              <!-- Main Headline -->

              <p
                class=3D"heading"
                style=3D"text-align:center;"
              >

                Looking for reliable dental CAD design support?

              </p>


              <!-- Main Offer -->

              <div class=3D"offer-box">

                <div class=3D"offer-small">
                  Special Introduction Offer
                </div>

                <p class=3D"offer-title">
                  YOUR FIRST 5 CAD DESIGNS
                </p>

                <p
                  class=3D"offer-title"
                  style=3D"font-size:30px;margin-bottom:10px;"
                >
                  FREE
                </p>

                <p class=3D"offer-text">

                  Experience our quality, turnaround time and
                 digital workflow with your first 5 designs free.

                </p>

              </div>


              <!-- Intro -->

              <p class=3D"body-text">

                YES Dental provides digital CAD design support
                for dental clinics and laboratories internationally,
                helping dental professionals manage their cases with
                <strong>reliable quality, fast turnaround and a smooth
                digital workflow.</strong>

              </p>


              <p class=3D"body-text">

                Our CAD team is
                <strong>trained by German dental technicians</strong>
                and follows
                <strong>German quality standards</strong>,
                with more than
                <strong>25,000 successfully completed designs.</strong>

              </p>


              <!-- Primary CTA -->

              <div class=3D"primary-button-wrapper">

                <a
                  href=3D"https://u59058931.ct.sendgrid.net/ls/click?upn=3D=
u001.WDpxVHq0KFIUzSnNtAF6-2B-2B2wuz-2BOE68lllXI8C-2F0HMCbyMkWLy9YdqM6PBEJC9=
-2BL06eXIKs-2BkiNBagvL3ky5WpbjhOoOkePvn0Y8BxtRZ4qhjHqJib3IVma0uJgqMK0Yf1WlP=
xaQI9b43CJYQ90eJQoH2lEAhH73XopHO8ZMHWoQ9Uf9Uv41DuFRYdxeVzDah-2FcJ4yE5Xxu57a=
XsOiK8UB-2FbKwevgeHjieBwBZ5Jzvg-3Dwi-y_b-2Fb9pt9xKHnxuD6lw99EEuSb7yotTbfa1g=
sj17M5wGLHEOe-2Fe5zikHNEyCpBBACN6Oi70T8OSScX9BVyyKJWXilRv5iEZWeTnT8s0niViTt=
ZqjpC-2Fx8gAx-2FfCYvqzpJOvKfzf8Dq4T4G52d-2BHVTYyilXPnTb4w9LU9P-2FnGNDRhB3vR=
vrVfaAPj1LvpY2h-2FvaJULyR8iD7yknA2gFKExUlokMsdLEzMWOuwvCFN3T0QCSqQTK9d2CIjJ=
Vl-2F97EK5-2FA3x753-2BfJFf1AFKTXNrp3eog-2BRT5Bj29oHrwwsGPcCdzUcwryqGx54m0gR=
qWoyYyv1qSC-2FVqMdOOKcD1wEvt7LXD0ANXPTmi9RfpB9fX2HSUmmGqEwRzx2IYnH4-2BUp5qZ=
5PWkGUenf-2FA-2BKQLtLLi5wHCxGBfEKpHaD7fea7hU0JzwL-2Buk95C-2FklC-2F1cP-2BnQU=
-2FFBbwcuJpmHTUJzZxmaQzOh1b8tVj7RuR1pN0PhKoDtvZez-2BQKgq2CsS9Xy4RxHwYGFbioy=
OUxsSivBTMhTayNB2ZLE-2B-2FRTnHtGirfKv-2FqVZQQPE-2FZLhuG1YTZzsZpBGKvzzuYnQru=
VJmlA9fcVFntZTHOw3uqLMnI3dL1Zsx9YsDHV43tIKn5eWr54XXZD8SdZRNSi5mq24bypPLaxoK=
PlqqkHiuYuVq7LjpUMFDrYrXv-2BD1BapJOmaCJa05TDEpQ9fEI3meTBKiAQD3yoy0f00yltdG0=
tdeWeiqpidgzpcuW71YwuIPlWORxKM3mFMkKNOjZyRgfyp45BD7kFqGVMtquUPpu8Q-2F0iQlX4=
l1jsB4f4I6PUi5e4XH2N8Mcn85VITuRkJxRtzqQQqbWNuIxxjyPQtMmQ-2FBZdIcCJfOh8B4Zvg=
F6cQeC-2FcqSSswU-2FbNYlOfMY3KoJSXScwpL-2FEyw-3D-3D"
                  target=3D"_blank"
                  class=3D"primary-button"
                >

                  SEND YOUR FIRST CASE

                </a>

              </div>


              <!-- Why YES Dental -->

              <p class=3D"sub-heading">

                Why Dental Professionals Choose YES Dental

              </p>


              <div class=3D"benefit">
                =E2=9C=93 German quality standards
              </div>

              <div class=3D"benefit">
                =E2=9C=93 25,000+ successfully completed designs
              </div>

              <div class=3D"benefit">
                =E2=9C=93 Fast and reliable turnaround
              </div>

              <div class=3D"benefit">
                =E2=9C=93 Overnight CAD support
              </div>

              <div class=3D"benefit">
                =E2=9C=93 Easy digital case submission
              </div>


              <!-- Services -->

              <p class=3D"sub-heading">

                Our CAD Design Services

              </p>


              <div class=3D"service">
                =E2=80=A2 Crowns &amp; Bridges
              </div>

              <div class=3D"service">
                =E2=80=A2 Implant Restorations
              </div>

              <div class=3D"service">
                =E2=80=A2 All-on-X / Full Arch
              </div>

              <div class=3D"service">
                =E2=80=A2 Abutments
              </div>

              <div class=3D"service">
                =E2=80=A2 Removable Restorations
              </div>

              <div class=3D"service">
                =E2=80=A2 Night Guards
              </div>


              <!-- Offer Reinforcement -->

              <div class=3D"offer-box">

                <p
                  class=3D"offer-title"
                  style=3D"font-size:21px;"
                >

                  Ready to Experience YES Dental?

                </p>

                <p class=3D"offer-text">

                  Send us your first case and experience our
                  <strong>quality, turnaround time and digital workflow</st=
rong>
                  with your
                  <strong>first 5 designs completely free.</strong>

                </p>

              </div>


            =20
              <!-- Secondary CTA -->

              <p class=3D"cta-note">

               <strong> Not ready to send a case yet?</strong>

              </p>


              <div class=3D"secondary-button-wrapper">

                <a
                  href=3D"https://u59058931.ct.sendgrid.net/ls/click?upn=3D=
u001.WDpxVHq0KFIUzSnNtAF6-2Bw7rTQwGna4kulzP7lueA0AOZxFpAumJEr3ySmQCGMW534fX=
SzwvkjJJKOSlqXFGUHkbaNk1zBd7TtXIbolmatMtXuD65YQgPI0EgGfABsGylwQu94wFYWYanFc=
K824zIPuXkSLjo0-2BNdS5MAicimXOSZsPQ4G8fEYFhPmFz8go8gp-2BncpWTdXq7CgGTdZ1p8-=
2FIZcGKwHjbL8i3-2B6sKMvCqwMaXerXErlMGv5fO7DWh84cchfwSPcB4-2FMAHEDsuvT75N-2F=
vXC0SEjQOkslL-2FcONo-3DCiNn_b-2Fb9pt9xKHnxuD6lw99EEuSb7yotTbfa1gsj17M5wGLHE=
Oe-2Fe5zikHNEyCpBBACN6Oi70T8OSScX9BVyyKJWXilRv5iEZWeTnT8s0niViTtZqjpC-2Fx8g=
Ax-2FfCYvqzpJOvKfzf8Dq4T4G52d-2BHVTYyilXPnTb4w9LU9P-2FnGNDRhB3vRvrVfaAPj1Lv=
pY2h-2FvaJULyR8iD7yknA2gFKExUlokMsdLEzMWOuwvCFN3T0QCSqQTK9d2CIjJVl-2F97EK5-=
2FA3x753-2BfJFf1AFKTXNrp3eog-2BRT5Bj29oHrwwsGPcCdzUcwryqGx54m0gRqWoyYyv1qSC=
-2FVqMdOOKcD1wEvt7LXD0ANXPTmi9RfpB9fX2HSUmmGqEwRzx2IYnH4-2BUp5qZ5PWkGUenf-2=
FA-2BKQLtLLi5wHCxGBfEKpHaD7fea7hU0JzwL-2Buk95C-2FklC-2F1cP-2BnQU-2FFBbwcuJp=
mHTUJzZxmaQzOh1b8tVj7RuR1pN0PhKoDtvZez-2BQKgq2CsS9Xy4RxHwYGFbioyOUxsSivBTMh=
TayNB2ZLE-2B-2FRTnHtGirfKv-2FqVZQQPE-2FZLhuG1YTZzsZpBGKvzzuYnQruVJmlA9fcVFn=
tZTHOw3uqLMnI3dL1Zsx9YsDHV43tIKn5eWr54XXZD8SdZRNSi5mq24bypPLaxoKPlqqkHiuYuV=
q7LjpUMFDrYrXv-2BD1BapJOmaCJa05TDEpQ9fEI3meTBKiAQD3yoy0f00yltdG0tdeWeiqpidg=
zqfxkr-2BelM07NczqEmXZnUoF3MZqZQqspajlwnnpH9dod-2BUM91KPQqSf8skiurk602gjVei=
D1GCUi9VXsLgag2gay2VSTOhDJV0nRyePP8fpu7NlLBRpQTN1HxlsVdOC0qFWYghLgT8wCmr-2F=
C-2BOF26f3-2FlBi8xgWQEWKeUPLOqskw-3D-3D"
                  target=3D"_blank"
                  class=3D"secondary-button whatsapp-button"
                >

                  CHAT ON WHATSAPP

                </a>

              </div>


              <div class=3D"secondary-button-wrapper">

                <a
                  href=3D"https://u59058931.ct.sendgrid.net/ls/click?upn=3D=
u001.WDpxVHq0KFIUzSnNtAF6-2B3oiL6otF7X7-2FVoMoysfyx-2Fv8WynsxCx21YoSUx7MV0v=
f-2Fb-2BvIXCh70sZuYqc7PsNQ-3D-3DWPL4_b-2Fb9pt9xKHnxuD6lw99EEuSb7yotTbfa1gsj=
17M5wGLHEOe-2Fe5zikHNEyCpBBACN6Oi70T8OSScX9BVyyKJWXilRv5iEZWeTnT8s0niViTtZq=
jpC-2Fx8gAx-2FfCYvqzpJOvKfzf8Dq4T4G52d-2BHVTYyilXPnTb4w9LU9P-2FnGNDRhB3vRvr=
VfaAPj1LvpY2h-2FvaJULyR8iD7yknA2gFKExUlokMsdLEzMWOuwvCFN3T0QCSqQTK9d2CIjJVl=
-2F97EK5-2FA3x753-2BfJFf1AFKTXNrp3eog-2BRT5Bj29oHrwwsGPcCdzUcwryqGx54m0gRqW=
oyYyv1qSC-2FVqMdOOKcD1wEvt7LXD0ANXPTmi9RfpB9fX2HSUmmGqEwRzx2IYnH4-2BUp5qZ5P=
WkGUenf-2FA-2BKQLtLLi5wHCxGBfEKpHaD7fea7hU0JzwL-2Buk95C-2FklC-2F1cP-2BnQU-2=
FFBbwcuJpmHTUJzZxmaQzOh1b8tVj7RuR1pN0PhKoDtvZez-2BQKgq2CsS9Xy4RxHwYGFbioyOU=
xsSivBTMhTayNB2ZLE-2B-2FRTnHtGirfKv-2FqVZQQPE-2FZLhuG1YTZzsZpBGKvzzuYnQruVJ=
mlA9fcVFntZTHOw3uqLMnI3dL1Zsx9YsDHV43tIKn5eWr54XXZD8SdZRNSi5mq24bypPLaxoKPl=
qqkHiuYuVq7LjpUMFDrYrXv-2BD1BapJOmaCJa05TDEpQ9fEI3meTBKiAQD3yoy0f00yltdG0td=
eWeiqpidgzqE7svZNbJRIkY8NjinigvCmSPHmrqRvoOusAW5hIwTCHSrUSoYKcrLk7d-2Fynla0=
flD2REAFeawpgAQERRpm9d8MtQNXxjn28MPDfsomcsGAIZt0RsD-2Faz5kwWtWvK-2B5Y7DCZ6S=
Fiw-2FdG9JvuFCvfgI8OaJ6MfB8pEyQzdqPhq45g-3D-3D"
                  target=3D"_blank"
                  class=3D"secondary-button calendar-button"
                >

                  BOOK A QUICK CALL

                </a>

              </div>


              <!-- Closing -->

              <p
                class=3D"body-text"
                style=3D"margin-top:22px;"
              >

                We'd be happy to discuss how <strong>YES Dental</strong> ca=
n support
                your dental CAD requirements.

              </p>


              <p class=3D"body-text">

                <strong>Best regards,</strong>
                <br>
                <strong>YES Dental</strong>

              </p>


              <!-- Contact Information -->

              <p
                class=3D"body-text"
                style=3D"margin-top:20px;"
              >

                =E2=9C=89=EF=B8=8F
                <strong>

                  <a
                    href=3D"mailto:info@yesdentallabs.com"
                    style=3D"color:#163d63;text-decoration:none;"
                  >

                    info@yesdentallabs.com

                  </a>

                </strong>

                <br><br>

                =F0=9F=8C=90
                <strong>

                  <a
                    href=3D"https://u59058931.ct.sendgrid.net/ls/click?upn=
=3Du001.WDpxVHq0KFIUzSnNtAF6-2B-2B8rwy9LovmH-2BdSt-2BtSgX5rwoJr5YV1C2mR-2FH=
E9le1RPrmO-2BRibj8CcpHakC9q3-2F0ZD0z3hdwt8C-2F2Ir0KJjmXhYJDLPLwpuzDKvVP20Bp=
LAbnpKChRoynITC8Kg-2B96Q7D9DSq7IXqXnrv502QdcDINRbcpo93pbiMgLQT90mZUgSk2yZ-2=
FCTqGFMVhHdCkZqKQ-3D-3DzOBY_b-2Fb9pt9xKHnxuD6lw99EEuSb7yotTbfa1gsj17M5wGLHE=
Oe-2Fe5zikHNEyCpBBACN6Oi70T8OSScX9BVyyKJWXilRv5iEZWeTnT8s0niViTtZqjpC-2Fx8g=
Ax-2FfCYvqzpJOvKfzf8Dq4T4G52d-2BHVTYyilXPnTb4w9LU9P-2FnGNDRhB3vRvrVfaAPj1Lv=
pY2h-2FvaJULyR8iD7yknA2gFKExUlokMsdLEzMWOuwvCFN3T0QCSqQTK9d2CIjJVl-2F97EK5-=
2FA3x753-2BfJFf1AFKTXNrp3eog-2BRT5Bj29oHrwwsGPcCdzUcwryqGx54m0gRqWoyYyv1qSC=
-2FVqMdOOKcD1wEvt7LXD0ANXPTmi9RfpB9fX2HSUmmGqEwRzx2IYnH4-2BUp5qZ5PWkGUenf-2=
FA-2BKQLtLLi5wHCxGBfEKpHaD7fea7hU0JzwL-2Buk95C-2FklC-2F1cP-2BnQU-2FFBbwcuJp=
mHTUJzZxmaQzOh1b8tVj7RuR1pN0PhKoDtvZez-2BQKgq2CsS9Xy4RxHwYGFbioyOUxsSivBTMh=
TayNB2ZLE-2B-2FRTnHtGirfKv-2FqVZQQPE-2FZLhuG1YTZzsZpBGKvzzuYnQruVJmlA9fcVFn=
tZTHOw3uqLMnI3dL1Zsx9YsDHV43tIKn5eWr54XXZD8SdZRNSi5mq24bypPLaxoKPlqqkHiuYuV=
q7LjpUMFDrYrXv-2BD1BapJOmaCJa05TDEpQ9fEI3meTBKiAQD3yoy0f00yltdG0tdeWeiqpidg=
zqJhHe5dX8BKNRp72SZzKnT5p49Ds-2BMFAbmeVmY3yhGroXQoqM3qrMcK0Wl7fTNBHO8gSsD78=
51Hb-2FUMQRsrssmGBwCJySSyt9fGSQAFRCz3B3LY9BO5rhnxXVfSwJbSI-2B69BCmZHuLAj65X=
AzvW0mXnjTTQPlBqbJr8Ne8odpq8Q-3D-3D"
                    target=3D"_blank"
                    style=3D"color:#163d63;text-decoration:none;"
                  >

                    www.yesdentallabs.com

                  </a>

                </strong>

              </p>


            </td>

          </tr>


          <!-- Footer -->

          <tr>

            <td class=3D"footer">

              <p class=3D"footer-text">

                =C2=A9 YES Dental =E2=80=93 Design Center

              </p>


              <p
                class=3D"footer-text"
                style=3D"margin-top:8px;"
              >

                You are receiving this email because we believe
                our dental CAD design services may be relevant
                to your clinic.

              </p>


              <p
                class=3D"footer-text"
                style=3D"margin-top:8px;"
              >

                <a
                  href=3D"https://u59058931.ct.sendgrid.net/asm/unsubscribe=
/?user_id=3D59058931&amp;data=3DXLIP2hBY_Fg0PGFOvgxwrUU2PE1o4KE1ZxWXhz0Dbx1=
oMDAwdTAwMA5eV0Pd0L5BRLfrh7r06vpzgS_4ci7WO_2gl_SoObS1sFd8HPRsfoKgwlIeJpUgO7=
4vYRFLt-cvmzHnPuip9rnBQ_x1PT_ERv8aeA_YMVaHwJ7RLihidDLot5IOY4X0uHgtrSITiUFFU=
-YAbZQWPvh998Cux0HkVUsjIM1qYDGFrttbpNLwp65klvow4J3GnRQOQcsezU5d7CQHZvEiszlt=
bt3E8cilbatzR-dC_c2XtNTWY9ogqJER3Ero0obeyoOrAxFPDzEBSeHA5DZUQ7x8kHHTBj3lBtL=
xfe563qgTN7yEK8uLMGneiQfJ-8-wcJyErWkzwJ4tZ4CAAsRWCqcdh1PximwSMBZQ1wTnae4zTY=
izJ_HrwAEy8813Xfun2vArRQLjBYOj2QcoOnbujbGo7--83hughyReurataCwxPRP8QozFXbZEy=
nprz1dDnwzitYQZcH_RRbmDG2dGVnTkjwgisU7uIvbdpuj0VL2IzjYCnM3oD8maagwuu_KndTaJ=
lyywAgW2NkPiKRCVO2dvtuqL2jjaJkQ7C3gfvgo2_wU-AISYc67pzj8Is5EEHdxtoOUr_Y20QK0=
BYxK3IQPJ-NVlji5xt5byduwmLrvqhVTtXmTlvlksI8dN9hbPGhHOvypwpdRcqPmLsEv4zAA0qh=
LZeaRQ3LnUsrXg_FmpxNqOkH7TvL_Qh-wjSWwDRpi1YP_BWTTJw2ZdSHHkQkGYFLR3pvRCWt7x9=
FFnZ6Cx6-A4PLCbFK30PuvW26nsjttD3eCfI1dRQKysuUBSwXiJfAnubKdR7OaG5tUiWjzMMevH=
XEOfjfVrQ2Dqc-Cf1Ejf1rCxjapxdadGnrIartatU82shLzNDe30nPCEYfF3nXyhPFVKUBsr7zj=
QeFN7gT_P8zd5TNmOd0fLF5wo1z9ooyBpqU3v1HYtqwvLLMuQOsK6QRFOzaMVyV9PPf1mkxE37V=
AorH-iDnVVoha2RTgkX1efz7NYFU6TTGbPST8YYQUIluDy05hZdGq3hjjdKlSRrMjIpIvrPj9CP=
at8saMMdEmLhCqJllFmEd84bs9X"
                  target=3D"_blank"
                  class=3D"unsubscribe"
                >

                  Unsubscribe

                </a>


                &nbsp; | &nbsp;


                <a
                  href=3D"https://u59058931.ct.sendgrid.net/asm/?user_id=3D=
59058931&amp;data=3DzhhJn7uqoSN_epMqsxWHpoj0-Yq21YUKBawPMbT5DfFoMDAwdTAwMN_=
H-Xzd8JfEs6Bm29rH3vl8xb-CXjGLX4uz9jV8a9PiWc270xrBMVyNV5IBE5DH2WKXzKpspDh8Go=
jyahIMxlR5udjKKlPoEOptFkWtpCmhTUzoIubyLitwFwfNe-GNgjIKzNo6LC66fNSe1WRRb0JPq=
0g6IbOSG8TXleBRxtwrOybrrsKks0DhFdRTBCPNilsTwOsM7N5SiVfo0V1nQvUEw6qo_857uRTP=
tMLK-nw_6v-2S9bKLR36Kj2xa4a87uJnL6DEklUY1Mwnx3ORsJS1sVDn3DV9GsHzGLXgDPQ-JBu=
Er39nN7cB6vonJ0xX5IyXJ1BreI4EF1VyEkLPeVyQq6G021FbOvG6-GiMBJYOKgVDFSrlwitdgJ=
5RKenicOdjo9hYUKH19upbuf7tIssk03pxPlO5KLFZ5r36ui0Z_U9T-WpbliMXnTJ4tIwJkODK5=
_he7c8rlkFsU6kFuMlnevLfJlMPROtiXbz-LCJhBgGvVR5f3Nhv_js4OitA798-IlU71v80N1x0=
_a621kz4J6Pfv7d0Yt8be4_5WybCxX8z8XdLMHzrG17k1HclQmVC5_zBv_pHddBWeuWXl6k-LE5=
K6zj109XtKqPcmkrs1tzlG9DKrnosQJocybG1_DKSTu_GHIPYu71c4wVAeRDA-nkMuHYLUtwORw=
aSCTkDBHCVKylNDXYiSfIGGTUOEWhySHl57YhXy834InmEKs3zFuSZ_vBlQOXPP2kr1vYQaFpHu=
CMO6_74waBY5VSf2_poB36yN5IRg4AowwjWHjgPkOioTa6j9kH1S8qPFR09g8tdVKBxF4pepKJK=
MuPkUe2RVJDAtts42nktZ_lUGPhpkA3ATzrXuCSDguW6Bl8pD9vlTa8xuGrWQ-Y6nGQ6tOMOJ2x=
dZCfD4_-dx-vAb5jJ7zHvO79uD_EOzUFD6ArMjLhaC3Iuy8vHsfW8kWnQ-i4MLvH4_a8dLOs7Ch=
usCPn0Fv-S534PKzR-YcztSISkoVBltoJFbm9fXZYTTEVg3Itg3mteIlUjkMg9VOGrstSPgyYLH=
sgVUp93pF9Ny_eN"
                  target=3D"_blank"
                  class=3D"unsubscribe"
                >

                  Unsubscribe Preferences

                </a>

              </p>

            </td>

          </tr>


        </table>

      </td>

    </tr>

  </table>

</body>

</html>
--db5fbd9d26af1d1eed4ef5173e550f0795f08c96a4758c36d088d2da71b1--
