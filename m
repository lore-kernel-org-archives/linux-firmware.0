Return-Path: <SRS0=CfUi=BJ=sendgrid.net=bounces+57143404-5cf7-linux-firmware=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62E2EFCD7C
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Mar 2026 10:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A65FCC19423; Mon,  9 Mar 2026 10:13:25 +0000 (UTC)
Received: from wfbtwnqf.outbound-mail.sendgrid.net (wfbtwnqf.outbound-mail.sendgrid.net [159.183.146.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A025EC4CEF7
	for <linux-firmware@kernel.org>; Mon,  9 Mar 2026 10:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A025EC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jabil-procurement.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sendgrid.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net;
	h=content-type:date:from:mime-version:subject:reply-to:to:
	list-unsubscribe:list-unsubscribe-post:cc:content-type:date:from:subject:to;
	s=smtpapi; bh=xDTsaLkj9zKPbl26ULlEtsD1xaCYEfnbku54VdTAVBw=;
	b=aUXb0iZF7zuItA7vd2NuWRI9NzlFgq5HRnZo726IWfhLZVEHTfIGMUuSknD4X4nLdjqf
	cuw9i1uGwFdlLaIHYpuhZ4I5WyHuEhUsNfPg/lqNsJ+TqyWiCe/3YsFFvJy2v0vv11d6op
	V3Vj+yXWJU/0GsGQsLyESNeZLwKQ6XbKU=
Received: by recvd-78b965c8d8-rz9gp with SMTP id recvd-78b965c8d8-rz9gp-1-69AE9BBF-53
	2026-03-09 10:06:55.531786584 +0000 UTC m=+7040085.612773152
Received: from NTcxNDM0MDQ (unknown)
	by geopod-ismtpd-43 (SG) with HTTP
	id 6NYa_jhvQuyE7-97TGl4gQ
	Mon, 09 Mar 2026 10:06:55.517 +0000 (UTC)
Content-Type: multipart/alternative; boundary=c3a8ef1e36880f9dd687cdd7ff2b192eed8d90cafc41c437c75a0df5f4dd
Date: Mon, 09 Mar 2026 10:06:56 +0000 (UTC)
From: Darrin Cremin <darrin.cremin@jabil-procurement.com>
Mime-Version: 1.0
Message-ID: <6NYa_jhvQuyE7-97TGl4gQ@geopod-ismtpd-43>
Subject: Request for Product Information and Collaboration Opportunity
Reply-To: darrin.cremin@jabil-procurement.com
X-SG-EID: 
 =?us-ascii?Q?u001=2ElbZlH1COuX2qm9ZEGVVOR+x1=2FXznCqXGxXVJAN5BFwDWvidODSl+HNk7n?=
 =?us-ascii?Q?qWSj4vb4zPAzt0BYdiqyWXOKSYngCHrN2TTQJaz?=
 =?us-ascii?Q?z4up6DTRxivI8F0MLmehybRX=2FQlproCTCsZd04P?=
 =?us-ascii?Q?6aWh6qF9jhDSvpJN32ctYpBl=2Fi+AZlkCeGLA2S1?=
 =?us-ascii?Q?zZlrK81eZ7GQ5JG1fZ4pFrN9tEinj++F3iink3=2F?=
 =?us-ascii?Q?Eu8KoILil5xfTDJ2hZhkjDy8AVUVsxVyfovENVw?=
 =?us-ascii?Q?7o5uTmxOYkO0ea3SToHGBErztQ=3D=3D?=
X-SG-ID: 
 =?us-ascii?Q?u001=2EXwhBPNhCejkv4+fVosb2QVfR16Qxp9CrA7PjDe5zzeI=2F0IZCBsPXtgHbA?=
 =?us-ascii?Q?oGIj+RskLxA4N2rJjSWrHfgX07tLOm0v5BUQcd6?=
 =?us-ascii?Q?w3knjorGi7Hwu0WCOA5AFSvy0=2FwlG32=2FFkTBe4Z?=
 =?us-ascii?Q?Xz4YW7KH6NSLWvsNDz5VEas7tvY3=2FMFepPl3PcV?=
 =?us-ascii?Q?0G3dbRFMrDWhV5ouatFSDvKQXmPLDYe3ENAIj2f?=
 =?us-ascii?Q?8EsJzWzUv9hqrh4mCo7GPeil8KNyot+DsTQ340E?=
 =?us-ascii?Q?0uL11V3eHdWYyw0wwW5SPzpVjxhyqNaf7lxB+OY?=
 =?us-ascii?Q?BMdKbrtfe5Egq6dqNGIdVhMycyQ1QuKZbVEih83?=
 =?us-ascii?Q?d3yC6TpAoGhwYTnRLm7QqwYfr0t8zFFfPV06zvo?=
 =?us-ascii?Q?XuoRO3zwWWwF4E14Ut7jesX2NNvCTHlfHCPgTw+?=
 =?us-ascii?Q?qn5vgKftt5v=2Fvoq30IXU7kyQVB3g=2FCmjR43m+tM?=
 =?us-ascii?Q?BVU2gtZe5P=2FOS6OORSO5zZEpu1UAbC4WH5Fjy29?=
 =?us-ascii?Q?6ViDvEBRsvyuvySyrGWdrEvB4X2LrBdMLTHkGQt?=
 =?us-ascii?Q?2D1d6wotpVm=2Fq6Ox7J1Lv8tVzP=2F5numV2R0y9k5?=
 =?us-ascii?Q?hHeZTPebUeCbMt5TeNUGTt29yrQCE58PoJY5WwL?=
 =?us-ascii?Q?RscTIEJWc7GisTPkxw6o1obirbK2ctyNLQHJXyt?=
 =?us-ascii?Q?QRmJ+XLrWEVAHK2I4koSeHYfhWSxE4LlUK1520l?=
 =?us-ascii?Q?O3DO4lJeVTH9BcjElHb0H3S1kQEyCc25fpCtyRJ?=
 =?us-ascii?Q?hjX6NQ=3D=3D?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
X-Entity-ID: u001.eY34wPqF4vnQZL/C6JiWQg==
List-Unsubscribe: 
 =?us-ascii?Q?=3Chttps=3A=2F=2Fu57143404=2Ect=2Esendgrid=2Enet=2Flu=2Funsubscribe=3Foc=3Du001=2EFp4=5F?=
 =?us-ascii?Q?564HQl6izpEjSw4q64knjkbRMot4w4LI1jEUaMl?=
 =?us-ascii?Q?OE84Ur9K4USLn9Sfn2s7KF2eSwkiboJdQLemXsi?=
 =?us-ascii?Q?FZjICYKea26tVXehaXAlKWdSh8HUGPHGhoZMxNy?=
 =?us-ascii?Q?9JsDZRxeh=5F-22DlBnnOGCiwlpSoQ0ukTbTN4iAU?=
 =?us-ascii?Q?vBgpzYsE=5FXHdlyuLGsy46Wprm-ckVB5WcHsHWRT?=
 =?us-ascii?Q?a3bdSK-xkevjue56VWBTUcxY9B9rC7Fw=5FAwDFqJ?=
 =?us-ascii?Q?kMSxo6M1fPK2HqNKYZyzquEnY4V26G9mPZmMlzO?=
 =?us-ascii?Q?0iPxNbqM7aap7p=5F8K8l3QvnKA26JYf4o-FHdBg4?=
 =?us-ascii?Q?s=5FXpFdEcXQxCnmkQLrEbmPz3SaAUgc3QF-qzX18?=
 =?us-ascii?Q?q5yrSzxi1FudwuWvOz655stSKKEOdwvwic6xO80?=
 =?us-ascii?Q?uGMkf0Ob37RhBkwnDXnbe7g=5FcRCNEE6iPsMaCFZ?=
 =?us-ascii?Q?HQBX6n=5FLsEVTKDjOj82CjYfxSFSLsFzCitg=5Fi=5FX?=
 =?us-ascii?Q?6qmSDvdEW1riojMV2VJEqt1PODtr=5FlGd-xLDxp9?=
 =?us-ascii?Q?Nf5xw2ClT4kr4nnsNlsb4yuslLmVy8AYB8Z1tbq?=
 =?us-ascii?Q?5se2XRP4PZk52dk2szvcDza1isDfdkNaFgshRD0?=
 =?us-ascii?Q?R1gQCq4UflE-TEhwtjiCpm9s3XvI9t3VSghA5Mu?=
 =?us-ascii?Q?AUY0yQ96-mTwt8pm=5FjhLHB=5FIgRbrnLyZCkWofKu?=
 =?us-ascii?Q?1hYkL3JsXguYC-UkvAp4w1TdiVfXm7EDogwDPED?=
 =?us-ascii?Q?-m8Qrfz5UUEvOAeepkAvQbP-=5FbxgTDzgJJHoVl6?=
 =?us-ascii?Q?V8utFC1DXjMDDOG60ZlY6IxwOokDHAbn6ALl5pk?=
 =?us-ascii?Q?WTtFM6YEcjqqmZygFo9PaD5votZla4PT57asIUJ?=
 =?us-ascii?Q?uXIFywnTzC670oJpTnvrXBn2JwVXbQHsIy1ZHcq?=
 =?us-ascii?Q?8SBhTFU=5Fm-hxFA4aKrtwRXyMxJbse82pxINLkR7?=
 =?us-ascii?Q?dkro74c9AEXxMy658NQrimkdxxrCC2BSBoG6OYW?=
 =?us-ascii?Q?DCCm5hHYviJhvYtFzm6s-4JJjTJUT3jX1PTgfgP?=
 =?us-ascii?Q?ZXIDnFGbUDgHSNy-OpEKcKwsnYJjGX-SoohSvzu?=
 =?us-ascii?Q?cGl5dw1omjCSVoJKvSxXW0S-=5FE8XMor3VNJhNdd?=
 =?us-ascii?Q?QBLoN14REKvpJmML-Krm0ux78CF0YjniM102zdk?=
 =?us-ascii?Q?FABXsELPaSYBb2MyvYFJXL0XRoK2LipknTJiMWU?=
 =?us-ascii?Q?op5mbXzT4qQta17dpwU6Q8ubElf=5FaA=5FjDjzqsNe?=
 =?us-ascii?Q?=5FLwfVrFj83qobGw0VmyiYT8ZFZcbuD8e1JTRBDs?=
 =?us-ascii?Q?buv3uobQagTht9EB82qnW5rNFSAd=5FqlwN5b00KI?=
 =?us-ascii?Q?iP9XCScLIrk9J-Y24UKgpEi-OIxejup9tXFRTzH?=
 =?us-ascii?Q?cWr1XiWZ9tBeGrv89YVCxMdG8YxI4MWEXb-VTCv?=
 =?us-ascii?Q?=5FQe4cWWR-fvTWZntg5fi8GkFC1SuS0Ao2dRxZfE?=
 =?us-ascii?Q?XlVkZmTHV1h2OhsGSDodDumwyMWnKvUfnHmSEAU?=
 =?us-ascii?Q?pjTsREjOQECSr=5F92F0wh6HyvdrUtci5NHNaNCo2?=
 =?us-ascii?Q?faNBIYIs7=5FdgmU5nePumloGr0OHZPseahV4Hkv2?=
 =?us-ascii?Q?It2kOFTF1dFBv=5FWmdsak3KxNTKkJfAMgp7I3lmD?=
 =?us-ascii?Q?3-j2BwKfd9RfT21Vb79qiWM1S3TIbmVRGP6rKva?=
 =?us-ascii?Q?5DXJmkWvIsf5ZrjDAP9KOhvEZuXyW1UopnLad=5FH?=
 =?us-ascii?Q?Vsv3uGlQrN5H0mgPJK24iSfAIqgrYcRH9EurXkr?=
 =?us-ascii?Q?pm0jR83WMK=5FvFROuuo64oe=3E=2C=3Cmailto=3Aunsubsc?=
 =?us-ascii?Q?ribe=40sendgrid=2Enet=3Fsubject=3D57143404=2EBKdH?=
 =?us-ascii?Q?GWdnw8IPtYAlFKaVCnvNVV8owA2hPIZgsihwAMl?=
 =?us-ascii?Q?oMDAwdTAwMEv6Leh-5uPqrgGiuQmjETbPeHDwch?=
 =?us-ascii?Q?1D15NY0v39XqM2RnEW-DbOcNp6cJ86kEkuV-=5Fhe?=
 =?us-ascii?Q?zt4IVDVzaSU2gqsMO9iT=5FarVr=5FOehrD9fj=5Frz1Z?=
 =?us-ascii?Q?tPiTDf7uW7pbTzVBjG2g2w=3D=3D=2E1GIGwYfYUmYDiO?=
 =?us-ascii?Q?aJafYYHUPbvwVSYtQcNO5rD=5FenOApoMDAwdTAwM?=
 =?us-ascii?Q?MtstjTAYDd7kznioK-N0ziDPykNTqKm87zjcr4i?=
 =?us-ascii?Q?wvZe-DEX8BOyU-JUXwRzaEyBUbv2ASQ1uVbVa5H?=
 =?us-ascii?Q?HsqXEGZkDn2HGBNsasS5UTC2AOSwqVxUgH9DRnX?=
 =?us-ascii?Q?VIi69XTp-3ianbliIn3X67LLGyFebGU6GGLKuZX?=
 =?us-ascii?Q?lqrVBjc5WjEfwTzsJ9iTH4lLtjHxC2NbFdYlzFT?=
 =?us-ascii?Q?DKKLxdtFZZpdLjHZjOZ92iolp-MbNRv8BqsDv5y?=
 =?us-ascii?Q?NXrV2BXiqX1Maw4co3YNkz1N9yd2BZv9Gk4KVga?=
 =?us-ascii?Q?44vPyeiWsZjnHRr6KXhD=5FZV3EnIQBd3jSeYOXVK?=
 =?us-ascii?Q?A3zC6v914-AijLPK19fUebZXL4lAh5Ow8EUbnCR?=
 =?us-ascii?Q?7w2nmBPAiJbxuXjqXFlPpj5Tt2nh36BOcBhpbfd?=
 =?us-ascii?Q?bEuRWXYOd3igP3tSFXh0S1CJBYfIxGJmPoehEym?=
 =?us-ascii?Q?Dq8Qii18CYRe4WUWNdOIvBCxsahV4lTizm2yer4?=
 =?us-ascii?Q?q441=5FwrunQKiN6ODUsen0haqvdUYhEBXzK0XdkM?=
 =?us-ascii?Q?k4wU9xrjslNdgFlu1oYUGeRswT7TnbwKM46rGoY?=
 =?us-ascii?Q?J2DFrH=5Fgt=5FSuDyliWLlYCaDdSuNEqMjyYjsGtsl?=
 =?us-ascii?Q?uxKY7XvbsltRIg0Gq5MRdvcEB5IQ1ht=5FosRxjiA?=
 =?us-ascii?Q?HGKdmQQYK2flRzaZvOu3ifn6uAyGTB1u9lQAzDP?=
 =?us-ascii?Q?Dn7a733UDsWjvdUZJ7256yMW77weX7bU53vRGDk?=
 =?us-ascii?Q?q1PbVa3IILQl3LtQ8OUPYmn490wnhwEWwQZEjsj?=
 =?us-ascii?Q?gGbEM0MENmD6uzpxs5lI4KbukiLVQ47Pz0lchTf?=
 =?us-ascii?Q?WNcIrOGvdAiFpM9ppFKN-pOoudE8ceHmUJZ-013?=
 =?us-ascii?Q?F6knARKnHbQBMW52kBflnaxOs9f5-BqkSJwawYX?=
 =?us-ascii?Q?HgDITTsPdENtqid1QoHOWrJLpVmImaeLEXCt798?=
 =?us-ascii?Q?xg3LRMQ5PKPrn0eVUI7oY=3D=3E?=
List-Unsubscribe-Post: List-Unsubscribe=One-Click

--c3a8ef1e36880f9dd687cdd7ff2b192eed8d90cafc41c437c75a0df5f4dd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Good day,

My name is Maria, and I am reaching out on behalf of the Procurement Depart=
ment at Jabil, a trading company based in Brazil.

We contacted you previously but have not yet received a response, and we wa=
nt to ensure our message is reaching the right person. Could you please con=
firm that this is the correct email for procurement correspondence?

Once confirmed, we would be pleased to share our product requirements, dest=
ination port details, and proposed payment terms, as we are currently evalu=
ating a potential order.

Your prompt reply would be greatly appreciated.

Thank you in advance for your attention.

Warm regards,

Lucas Bernando

Export Manager

+1 (120) 362-78213

Unsubscribe ( https://u57143404.ct.sendgrid.net/asm/unsubscribe/?user_id=3D=
57143404&data=3Dik1PNbFPa3gb70xXWNo_ZVyYOZccv-mMBYVNRtXNjXdoMDAwdTAwMAO8fcu=
nmtHXkZCqtB_6zYxJLg2DT_ycJjLCkapHVBsRE8PVq2l5D760WzmjeNlY2mP73ACiIjPxPRKEKS=
ves9h8CRJ6PnSrDz6d7CJGo4ZG37cpFLYd5o4WbU6hp9HCm_LdX97x56Sswg6vtALNfI5HyU4R5=
midPEFHSV_8OYzNIH2yT2QZ4JmCARYsRDXwN4w0uGDPYQuwaB9xX5legyuUSlj8826jJitm-qeF=
ft-tr9KvJR60HXely2r6HMYwa6syEz7Kqu4ac_30CUp9qpVIH2-6hmRxl8au6KWzVoE58AagKrD=
GXsSczb1SMVF6b-FMYZayWOLqONcSdFJupbySdmnoFmJ7A5zI-ZLRsoySqgM4pFcD09uZUiYoDR=
DHbPfOrqOTX527MqhDzIoIp60UveZl0QPn4dctmONLR2XW7qEM36HEvh2xvWnH04S6G8TPZ7XSt=
b-8LIpBP790UrlBgz-4pxmaVZbbPD4rKdtg6peoQEiyQIc6GrpateuLRSbcMV1DG3APr0GDfSMj=
W9y4p4vQt1-__Bpzac24BLHwk_xZNSNqtAoyuQUrlCTl9qBvegdVyC3XPzhHSPiro22H2o5SM1w=
-AaVfBC7L2RIkI25dDd343SvtH0__Cntnfvc-s8y7teLQ18YpCciUxYjJIcz7FGsyuQsovOfCyc=
tvVNPyM7e9DenaBYHF2O35qPyXtYlhOax1DnU_sygKjHjpX0yIaptHTz2NKA1z3LGBUFAm0nPvf=
-p1A30wz3iaGsVfYM17o5f-c6wqkVZYVy12Qfp2EDMSdwA9DaZLbO38I3-PwEUgMovfTqloE8pu=
8c-cujNZ3ihkrKhXQYkZX_eb98hft2EpSgBkRBb4Lg7lbzeiLZePZErAQMI8k2bQo9WfpwUb0d9=
4Vt-elnzb4TPdWJmFetwP4UqpmkJlHvE_d6LwFovY9L4uCWRbmrOWw77oXF_ynxLff_xgig02RI=
HeoVemTISa2py9pKwByEMTPvapLW1tqRNE628b9eMaFVEWIs4Cj5fD2XptrNhAs59Ny49vH52zr=
AwpBRPMy5IrMT7j1KJkfdRqAb5tLzrUnj_qNqcgVGbD-5WkAg0vfV8=3D ) - Unsubscribe P=
references ( https://u57143404.ct.sendgrid.net/asm/?user_id=3D57143404&data=
=3D6scAwt7iRfYmEFmOpWPyWb5zpM9_ITfbrNEIfstZ3FhoMDAwdTAwMKb-5jvsRZ0tswjRZzWv=
cacyRELCjgujgsAPiz1ox4c6g2zPCT3dK8g4EIlx0G85f7C0lTymBbkaM_6rrxjoT3_i3jqGwRw=
F7YVfN2tbmQtMmYiY_kKpR9MudNxJxagqrqJqBMMjCroHog7VBhDYLluaZiu8MgCtM69tX6f4Bn=
3UqzD6zBbGIRyLra_zVu0CQ3sa_-248DF8HWL8EGOcK792hGl9gof5hWgfrmSTW5BCvpFYSlyOX=
gaJf1JKb0SbNFulWYyLwcQDd5SvgrpIxagz06y8lgZZdVmPPcr1GhVdTOMvNokHz0rzx6eVi-aL=
zEcSuoiNKe6w4CEKiGje6-_-S6iAHaigoo8M7I3rPQNN3jEozfU_1VNS0EO7NwLL6sLpHqQ_ISf=
poKrYofFwqdbxRlye_dSCWNKOTAwcvA3JzE5SvUn1MURK2DpXPJsR4Ef-WcS12YdZt3DPpQw1GH=
RIuQUuvyYn2v6F8xrGuop_V_A1nb0W5sgvGfSwDFrIL1JZ6uyQJEZSvQe5hIpoPFwQFUPPpGq5y=
zsJDLUFnILhmsaWCuimfwo5VbidWkaiDYbO6Iza3JMyPjEL68FrU_EuRD1bz6iT0aGccEOetCCp=
VUwzcc0cBY_S1Y5NoY5Jdi8kWEC3tw5djGE8uc6DZZzTzgPQZ1wxWs6lpzljGuR5J6-OA9EjWns=
i09Wqr6XQRlhCfihYloakc7yER-uBYQ8-X3XjUsLXQcjihdo4lzOABOVm5Gf5l0l57_KUyTW8hQ=
cFq1Rjzpu6X-ut0xles-oLZnscDB3ydm2HGMFKCbuuD4qVIdGU5vBaZlmlhDyoH-Qj6ePXsZ0FE=
1Hb0-ADwFjRn1-jVyrgqIAenrKKY3E7gA9odBvFjehtrbXY_b0Fr_fP2TYQxrJEOQHvBZdxtBLL=
bDbBDBxfBXvT_8aqiu7g6OHLOsXaijoeWX3h6-Li16HCLm8MxMO7_d7drFpi_NXPK024_gd8Qrl=
DQlM7ClruWFKUwXEeY95nQFanx8iJpkMMddLNq3s0kWGF7xrQ5NcQ2gDNJDSPFqOCII9PYawaAu=
bxV2S5g0QaN0ObV-S2CQ=3D=3D )
--c3a8ef1e36880f9dd687cdd7ff2b192eed8d90cafc41c437c75a0df5f4dd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0


 <!DOCTYPE html>

<HTML><HEAD><TITLE></TITLE>
<META name=3DGENERATOR content=3D"MSHTML 11.00.10570.1001"></HEAD>
<BODY>
<P class=3Dp1>Good day,</P>
<P class=3Dp2><BR></P>
<P class=3Dp1>My name is Maria, and I am reaching out on behalf of the Proc=
urement Department at Jabil, a trading company based in Brazil.</P>
<P class=3Dp2><BR></P>
<P class=3Dp1>We contacted you previously but have not yet received a respo=
nse, and we want to ensure our message is reaching the right person. Could =
you please confirm that this is the correct email for procurement correspon=
dence?</P>
<P class=3Dp2><BR></P>
<P class=3Dp1>Once confirmed, we would be pleased to share our product requ=
irements, destination port details, and proposed payment terms, as we are c=
urrently evaluating a potential order.</P>
<P class=3Dp2><BR></P>
<P class=3Dp1>Your prompt reply would be greatly appreciated.</P>
<P class=3Dp2><BR></P>
<P class=3Dp1>Thank you in advance for your attention.</P>
<P class=3Dp2><BR></P>
<P class=3Dp1>Warm regards,</P>
<P class=3Dp1>Lucas Bernando</P>
<P class=3Dp1>Export Manager</P>
<P class=3Dp1>+1 (120) 362-78213</P></BODY></HTML>
          </p>
        </div>
        <p style=3D"font-size:12px; line-height:20px;">
          <a class=3D"Unsubscribe--unsubscribeLink" href=3D"https://u571434=
04.ct.sendgrid.net/asm/unsubscribe/?user_id=3D57143404&amp;data=3Dik1PNbFPa=
3gb70xXWNo_ZVyYOZccv-mMBYVNRtXNjXdoMDAwdTAwMAO8fcunmtHXkZCqtB_6zYxJLg2DT_yc=
JjLCkapHVBsRE8PVq2l5D760WzmjeNlY2mP73ACiIjPxPRKEKSves9h8CRJ6PnSrDz6d7CJGo4Z=
G37cpFLYd5o4WbU6hp9HCm_LdX97x56Sswg6vtALNfI5HyU4R5midPEFHSV_8OYzNIH2yT2QZ4J=
mCARYsRDXwN4w0uGDPYQuwaB9xX5legyuUSlj8826jJitm-qeFft-tr9KvJR60HXely2r6HMYwa=
6syEz7Kqu4ac_30CUp9qpVIH2-6hmRxl8au6KWzVoE58AagKrDGXsSczb1SMVF6b-FMYZayWOLq=
ONcSdFJupbySdmnoFmJ7A5zI-ZLRsoySqgM4pFcD09uZUiYoDRDHbPfOrqOTX527MqhDzIoIp60=
UveZl0QPn4dctmONLR2XW7qEM36HEvh2xvWnH04S6G8TPZ7XStb-8LIpBP790UrlBgz-4pxmaVZ=
bbPD4rKdtg6peoQEiyQIc6GrpateuLRSbcMV1DG3APr0GDfSMjW9y4p4vQt1-__Bpzac24BLHwk=
_xZNSNqtAoyuQUrlCTl9qBvegdVyC3XPzhHSPiro22H2o5SM1w-AaVfBC7L2RIkI25dDd343Svt=
H0__Cntnfvc-s8y7teLQ18YpCciUxYjJIcz7FGsyuQsovOfCyctvVNPyM7e9DenaBYHF2O35qPy=
XtYlhOax1DnU_sygKjHjpX0yIaptHTz2NKA1z3LGBUFAm0nPvf-p1A30wz3iaGsVfYM17o5f-c6=
wqkVZYVy12Qfp2EDMSdwA9DaZLbO38I3-PwEUgMovfTqloE8pu8c-cujNZ3ihkrKhXQYkZX_eb9=
8hft2EpSgBkRBb4Lg7lbzeiLZePZErAQMI8k2bQo9WfpwUb0d94Vt-elnzb4TPdWJmFetwP4Uqp=
mkJlHvE_d6LwFovY9L4uCWRbmrOWw77oXF_ynxLff_xgig02RIHeoVemTISa2py9pKwByEMTPva=
pLW1tqRNE628b9eMaFVEWIs4Cj5fD2XptrNhAs59Ny49vH52zrAwpBRPMy5IrMT7j1KJkfdRqAb=
5tLzrUnj_qNqcgVGbD-5WkAg0vfV8=3D" target=3D"_blank" style=3D"font-family:sa=
ns-serif;text-decoration:none;">
            Unsubscribe
          </a>
          -
          <a href=3D"https://u57143404.ct.sendgrid.net/asm/?user_id=3D57143=
404&amp;data=3D6scAwt7iRfYmEFmOpWPyWb5zpM9_ITfbrNEIfstZ3FhoMDAwdTAwMKb-5jvs=
RZ0tswjRZzWvcacyRELCjgujgsAPiz1ox4c6g2zPCT3dK8g4EIlx0G85f7C0lTymBbkaM_6rrxj=
oT3_i3jqGwRwF7YVfN2tbmQtMmYiY_kKpR9MudNxJxagqrqJqBMMjCroHog7VBhDYLluaZiu8Mg=
CtM69tX6f4Bn3UqzD6zBbGIRyLra_zVu0CQ3sa_-248DF8HWL8EGOcK792hGl9gof5hWgfrmSTW=
5BCvpFYSlyOXgaJf1JKb0SbNFulWYyLwcQDd5SvgrpIxagz06y8lgZZdVmPPcr1GhVdTOMvNokH=
z0rzx6eVi-aLzEcSuoiNKe6w4CEKiGje6-_-S6iAHaigoo8M7I3rPQNN3jEozfU_1VNS0EO7NwL=
L6sLpHqQ_ISfpoKrYofFwqdbxRlye_dSCWNKOTAwcvA3JzE5SvUn1MURK2DpXPJsR4Ef-WcS12Y=
dZt3DPpQw1GHRIuQUuvyYn2v6F8xrGuop_V_A1nb0W5sgvGfSwDFrIL1JZ6uyQJEZSvQe5hIpoP=
FwQFUPPpGq5yzsJDLUFnILhmsaWCuimfwo5VbidWkaiDYbO6Iza3JMyPjEL68FrU_EuRD1bz6iT=
0aGccEOetCCpVUwzcc0cBY_S1Y5NoY5Jdi8kWEC3tw5djGE8uc6DZZzTzgPQZ1wxWs6lpzljGuR=
5J6-OA9EjWnsi09Wqr6XQRlhCfihYloakc7yER-uBYQ8-X3XjUsLXQcjihdo4lzOABOVm5Gf5l0=
l57_KUyTW8hQcFq1Rjzpu6X-ut0xles-oLZnscDB3ydm2HGMFKCbuuD4qVIdGU5vBaZlmlhDyoH=
-Qj6ePXsZ0FE1Hb0-ADwFjRn1-jVyrgqIAenrKKY3E7gA9odBvFjehtrbXY_b0Fr_fP2TYQxrJE=
OQHvBZdxtBLLbDbBDBxfBXvT_8aqiu7g6OHLOsXaijoeWX3h6-Li16HCLm8MxMO7_d7drFpi_NX=
PK024_gd8QrlDQlM7ClruWFKUwXEeY95nQFanx8iJpkMMddLNq3s0kWGF7xrQ5NcQ2gDNJDSPFq=
OCII9PYawaAubxV2S5g0QaN0ObV-S2CQ=3D=3D" target=3D"_blank" class=3D"Unsubscr=
ibe--unsubscribePreferences" style=3D"font-family:sans-serif;text-decoratio=
n:none;">
            Unsubscribe Preferences
          </a>
        </p>
      </div>
    <img src=3D"https://u57143404.ct.sendgrid.net/wf/open?upn=3Du001.1UC-2F=
G1r4q2F7W-2BfmxQXtFY8PR56g3aMsFDDO4-2FL-2FOLCER0pqLVK1b6Ngi6uwa5S1jNb-2FVRE=
Rr2RomskZ-2BadcNPfCszgKLP3Fl7U9DxTyPvHx9MmO1gucbg4g-2BPIJ0j59wmYq5N8z0ufNpK=
kJx9FSDalRnwp46B-2Fe0KUc-2Ff0ytmTnhBNvhoo3fXUdcah5sEHILn6FErcwQmO1cGSgVc3cB=
wGfeCT7xnBNZ63WtHNdYoUFsyVHSVXwwxGXZQ7V3Ih21a-2BvewTL2S2zdiTxjxdyaPeZfGKkI-=
2BmTE6tZHCmm9pUBmZY8Hg-2BUmGy6RPcnKpY822MYzLiGi8vcCaihNaWK5IIXpuUoZPYbAnJ-2=
B3N3XDwLMwnlVId-2BTxWpuORvOFqlvfwTV5ogqQubZl65Zj4HBUcjTXwgyF3BXkRGJTas63mke=
L6ZkDGeEg7lV4KUg8Xv51spVpFGJAZxntGInw9T1Ty51xx8rzn5qIP2eiyBQaR7rZj-2BZwI62B=
tJQCC0LptI53yx2tn8hZ2eA7SZIqBSlM3yon4eYjQZO-2F8xUsX9iPcciEjxi2s-2BcvqXu-2Bo=
-2FdSJBP-2FYwvXZ2cCq7G8-2FGuLOPZUzZxCj5Wo29T7DD9plFag2WFW9N2qZlIndX-2BmpUHE=
hWEZoKkUKI7IDwRVE-2FQywjDFfOoRweNQKOWEfVoo89geo9ZYfFq28oLj9k5Zng0IZo-2BGjQt=
Ubwk0qCQY-2B-2Fe88vuIy4JNysBA-2FkuEdPP2L0Ic80t2deDr94SzwLYttD2oe-2F1rlfAVwL=
-2BC6q-2B0aWgqemvRTLkKqtY2Ta9ml1gaKQfa0NRtuw3bTKu2gZL2FS2JwN019o5W-2BbmgyLI=
LUadMvYIOl84h25dvLpT3IEss9RP9Rn43jy-2FfWTd6EB38GNI-2B7mj9bliq3EZ0QHbFbzrAH4=
PiSXF1nN3mp-2F7Q3tHnnPQdX64xQVD1bcJPih6QpF8oVIg" alt=3D"" width=3D"1" heigh=
t=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !important;bo=
rder-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;=
margin-right:0 !important;margin-left:0 !important;padding-top:0 !important=
;padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !imp=
ortant;"/></body>
  </html>

--c3a8ef1e36880f9dd687cdd7ff2b192eed8d90cafc41c437c75a0df5f4dd--
