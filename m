Return-Path: <SRS0=LIDv=PS=em8335.mfarrukhassociates.com=bounces+46241961-50c8-linux-firmware=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EEFC3DA4A
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Aug 2024 16:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2491AC4AF0F; Mon, 19 Aug 2024 16:16:23 +0000 (UTC)
Received: from cskrhhvt.outbound-mail.sendgrid.net (cskrhhvt.outbound-mail.sendgrid.net [198.21.0.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D298FC32782
	for <linux-firmware@kernel.org>; Mon, 19 Aug 2024 16:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D298FC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=mfarrukhassociates.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=em8335.mfarrukhassociates.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mfarrukhassociates.com;
	h=content-type:from:mime-version:subject:reply-to:to:list-unsubscribe:
	list-unsubscribe-post:cc:content-type:from:subject:to;
	s=s1; bh=7F0QBvLCHzDMFDmlLbejXKFv5xrDr3FUjeHiIXvV8ME=;
	b=axc/1mkuG6BqU6tRN7PBoIHkytkSUciBTr72tS7mFH6GawVVJubKj7Hzj/6lojuUX9TA
	kaFawZeWxYwAR9WI64Ebbc085fJg6cMwGnTn3HgTkXVHnfHaJT+s0NiQLpo6Sm6gI0z1J7
	QR7IpbOwU/LKmWR9hyYdGllS/H+qsybycuBN7eAQmqF911lCHRX60SfI7uy57ISvLP4fLe
	oiIeD3MhhxtAV7UCurFT5OLiAzECbnKkLwfeSHvW5LG+zeR++Qyijkdt/sGY8PWAafSd0k
	HZxFonzgh1NT0zXU/5cmapAyQtijK3obhpOFai1gaKgSpW+07vJDvMFV/Kcth3Tg==
Received: by recvd-76f48dc48-4ftlq with SMTP id recvd-76f48dc48-4ftlq-1-66C36FD4-1A
	2024-08-19 16:16:20.42067432 +0000 UTC m=+1796153.354883902
Received: from NDYyNDE5NjE (unknown)
	by geopod-ismtpd-21 (SG) with HTTP
	id SON76mHgSE2tqqe7B7foag
	Mon, 19 Aug 2024 16:16:20.365 +0000 (UTC)
Content-Type: multipart/alternative; boundary=3ee92477c151d5f0fcc76d7954fd69176a92701b042623d139d355ee359f
Date: Mon, 19 Aug 2024 16:16:20 +0000 (UTC)
From: ACH <ACH@mfarrukhassociates.com>
Mime-Version: 1.0
Message-ID: <SON76mHgSE2tqqe7B7foag@geopod-ismtpd-21>
Subject: ACH-Wire Authorization for Invoice9876545
Reply-To: evangpaul@mfarrukhassociates.com
X-SG-EID: 
 =?us-ascii?Q?u001=2EySlMcyWYZS7TNnZvGSyfeP7h59BnnKTd805QacoQR27B6XwdBzyaM=2FvIy?=
 =?us-ascii?Q?3CzeM3jHtaaretoOk8UgSJsCsnmq93IMu2kr+8e?=
 =?us-ascii?Q?y6NSjJJmtR6STXWr=2FI5VXWfIiiU36IJp68cr5kM?=
 =?us-ascii?Q?XuYwzpAbiyq2nhqgDFZSpJD4ezA9D7gVS21QSPL?=
 =?us-ascii?Q?m690MWLMp+UfFIGHIqgpvBr9+IRgzcqVmsVndbY?=
 =?us-ascii?Q?i8w6KMcf9pjUB3idO8F1tBqIUTpKp16vOf2Fvw0?= =?us-ascii?Q?oHNX?=
X-SG-ID: 
 =?us-ascii?Q?u001=2EXwhBPNhCejkv4+fVosb2QVfR16Qxp9CrA7PjDe5zzeI=2F0IZCBsPXtgHbA?=
 =?us-ascii?Q?oGIj+RskLxA4N2rJjSWrHfgX07tLOm0v5BUQcd6?=
 =?us-ascii?Q?w3knjorGi7Hwu0WCOA5AFSvy0=2FwlG32=2FYliJ9cf?=
 =?us-ascii?Q?5vuFku1kXHT+PwocWEoNmBxthkUwFedZLAPeCTd?=
 =?us-ascii?Q?0J35a69el3VYLYJhivOg0XjIbBb8WeTuEQrGLLo?=
 =?us-ascii?Q?fwhTeWKxQ8wlRJUgKYYU4WBvMN2BtYuZJ=2FJn4Ec?=
 =?us-ascii?Q?se8aXbvJkbVg=2FVsB3vXTMId=2FWrnoqwwwTOFaK3P?=
 =?us-ascii?Q?kS4312HRtBuZMHTp5qHwB+s39HtaqjoyfuMR3XZ?=
 =?us-ascii?Q?PixDEWzOEP1MXJxz44LS4lv35vjhnmaX+r74c4q?=
 =?us-ascii?Q?W7FSYStVz2u=2FMqhjclw0nX8er=2FuyKg6sfnPuQ1t?=
 =?us-ascii?Q?LmHwfrr+A4YIzNTUGq4mzdViwXZKPjFGEe4dR1Q?=
 =?us-ascii?Q?sTQrvp=2Fql8tqcca2vXqqu47iVljTfWDFw27A+OG?=
 =?us-ascii?Q?aAszBefFo1U1qH4ebArX65vGRsiENMV6IfptiWC?=
 =?us-ascii?Q?2fMPmjdR=2Fyc3qKSKbowrGCCCaPx1Cq4M8JoUmtm?=
 =?us-ascii?Q?6n06ETK=2F3JaDEM5m1Txw7EEXTKKh+eOhRZrw+Sh?=
 =?us-ascii?Q?6+mPOZfX5OcAFQwwIgBmuJA=2FkOCIRjIOfMy3TKT?=
 =?us-ascii?Q?cHkIs3PYWrSQ+dOrKDJNpdQoW3iKAEBODZkdOFU?=
 =?us-ascii?Q?b6O6SQH4bgoexZhIfMzVoyi?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
X-Entity-ID: u001.3JyzWNhF9ZxgvV1lZ+pLnA==
List-Unsubscribe: 
 =?us-ascii?Q?=3Cmailto=3Aunsubscribe=40em8335=2Emfarrukhassociates=2Ecom=3Fsubject=3D4624?=
 =?us-ascii?Q?1961=2EumPNwESbDHtCPpPgzcGb2PAXzii6CsVwem?=
 =?us-ascii?Q?EC-XiO4FRoMDAwdTAwMBDdBrDXPls9DkgY63zz8?=
 =?us-ascii?Q?KDxqUSeCIvoZiQlSQMpc0yxkCmQ=5FOl4fJgAD3Rb?=
 =?us-ascii?Q?R8DVVj9pv5RCL4xrIw2M-a1ZQnLG-aH2Ijuxj9J?=
 =?us-ascii?Q?ny8Vs9YGR5U09QE-X3lF7-IxpB-TvFg=3D=3D=2E-KmtU?=
 =?us-ascii?Q?RjDa8Aqo8Tqg6-QQ1-2ZraPfnEOYtIvHmpvvg1o?=
 =?us-ascii?Q?MDAwdTAwMHYTREttA2OG5B1-pNWvSsOKTGKi9iV?=
 =?us-ascii?Q?eFhpynw957UTML4zeFp-kHoSbGCWTzH88mJ0Nz1?=
 =?us-ascii?Q?KIwCXSFlR1sLSdJYCi0L87WDfPBKgcAsi2uaOen?=
 =?us-ascii?Q?=5FM7DTk5redBykZ0iSniqmXnkFiXnna1kKRrj1E4?=
 =?us-ascii?Q?VV2eyy1TIX-tBll25pMEQ0XpH14QzDWAKo9rydg?=
 =?us-ascii?Q?CxbYIBQlgGIdgitOwkf2b7zHzDohOBClyisbJdJ?=
 =?us-ascii?Q?3-wW-Bs=5FFqPDrPf9SFvFfNxyJ0Ifu0XSW64Y4jk?=
 =?us-ascii?Q?DRRRy=5F6nMMXr4D=5F190ZjbGuS7ArFZa7CtPu-DGy?=
 =?us-ascii?Q?oQMFeZAnqiG-XIQTGZKYixYEIh7srQDdarhuUOa?=
 =?us-ascii?Q?h-bYWzpn5JmV52ZgavsAvJ=5FzFFKuB4lkNZcuq4k?=
 =?us-ascii?Q?rYBlECTPz7TKapmugm8ENuIqQBaeszzWlD-VmkF?=
 =?us-ascii?Q?mbRaAP9uFSlRTLMU7rrfRFNtfvB9TJpnMdZzXZL?=
 =?us-ascii?Q?QVg5IJE5iYwJDTqQKiuW=5FsgASaIl=5F7hwVJpMR6F?=
 =?us-ascii?Q?6auYgGtl4V3s2-D1uokEHmu62f6BP3c1WEGPfzk?=
 =?us-ascii?Q?nxLlVghpUU89iXzUHJWujnoHwCsplhgorC6RI9T?=
 =?us-ascii?Q?oPTL=5FA2YHcyr4nb1JhUYHDMkj70ZTTTrq4e7hTP?=
 =?us-ascii?Q?DM=5FCmlbaTqSZcmV=5FmxHwnTMBnAEphRQuu0Z8QQm?=
 =?us-ascii?Q?0dktuIid6SuPZnYBAUgSdmFq3QwIpWU7EHPp-vn?=
 =?us-ascii?Q?ympKiIHkuudyHRK1R5Sg-iTyIyXTS6fpwzdVK8t?=
 =?us-ascii?Q?Rl=5FuOT55vOD6h4u2rM=5FUanvwzKLNOik-iV763Yv?=
 =?us-ascii?Q?dYJL6BASG1yJTBV4sMCXezxj91P1nJGEImdROPB?=
 =?us-ascii?Q?QHKC4MwW66x9jpKnz6-=5Fw3G=5FfnRXi01SXSgwYDP?=
 =?us-ascii?Q?tBfDLmandq6SZHqrdjCa=5FLc3y1HwTvzgg1cPAvH?=
 =?us-ascii?Q?FQiImpkmw=3D=3D=3E=2C=3Chttps=3A=2F=2Fu46241961=2Ect=2Esend?=
 =?us-ascii?Q?grid=2Enet=2Flu=2Funsubscribe=3Foc=3Du001=2EX8NLOYn?=
 =?us-ascii?Q?lBzxVUTTWqIV93qVurYyMnSuFTMPH7U2sGZp2zG?=
 =?us-ascii?Q?UCCUAP9=5FT=5FFxylvFLDP6LGITlVazfhTapGLP88z?=
 =?us-ascii?Q?q02TMDTrsWKxgohHRCBHz7hU2=5FJHHyiO7JHUX3j?=
 =?us-ascii?Q?1HorIU6iLdel5PKQK76FnYx5AiT0uTTdzGeKmwL?=
 =?us-ascii?Q?MF0=5FxB2qFWctWQqcEftlTBk7cw9mr7l1FBciIRZ?=
 =?us-ascii?Q?3sEZtYH4J3aDV2IRBoQmtYfGSTMQ-ozG7EC4szk?=
 =?us-ascii?Q?WNwLiVl5XwimF88U-87tBh=5FAPNqg7OjypE1MEKC?=
 =?us-ascii?Q?9u4i2TwVd5AXqcD6c31abIeVt958GBOoyLu0zBb?=
 =?us-ascii?Q?OyKSBmBqZhcsg85X3aNDFO=5F1BTqbiRppW5SA83d?=
 =?us-ascii?Q?UXSWqWL1QiIK3Mt0cdjFFB6Ig-=5F=5FqZSqcOHcDDX?=
 =?us-ascii?Q?WyUD171ivfJt3eY05D=5FWjNgiCce1c7lQMs6mIe0?=
 =?us-ascii?Q?-CPs3eTdHwnv7aNtl5QZ-Bfn5FIdGCxTk8IZDDX?=
 =?us-ascii?Q?8MM7O7cr0-8hFqSmnKILv0FNFVs6vQs5cwHGf40?=
 =?us-ascii?Q?ytS477IMjjqQb3OhwxnvhzJQCKcS-MKhf7CN9lr?=
 =?us-ascii?Q?tKW9g4RFLa2QGnaDdgSGougsYz-u6ZGAajO9HT2?=
 =?us-ascii?Q?Rv5A2nt4vkqxoLjiD06neIqy56vkYuoZoHv4ZMr?=
 =?us-ascii?Q?NhkxJdwPYFvQ3MMtkIHJjgqinYUxyBw-y28pLHs?=
 =?us-ascii?Q?psrRxV1hRdVrblaZQgGmS87zeTZF66QyyDpT4Ij?=
 =?us-ascii?Q?al2v4eQp792hvKGoTbc7FYeOBQ16Z82rTVqJ3UF?=
 =?us-ascii?Q?npXAC7dMVF5KRFN13jMRh7uDH4myUqFbRczxwv4?=
 =?us-ascii?Q?XH=5FcDSBIHCX0fvP3os7Qbsij42981ruf8kOSf8X?=
 =?us-ascii?Q?FmEt9LVvXNUIcQlczEj0absblfGkw5jCx99p1x5?=
 =?us-ascii?Q?zIX9l=5FQ8z9aQLrbvxw9mTcgLRzUC6mcWmA51TVI?=
 =?us-ascii?Q?JNcJ9gRUD2cTPzvybtqTPYYVr=5FbHAHyFLVwXyA6?=
 =?us-ascii?Q?9w8X8QgHcqwCQ0vNi94SjS6G2UIHy6wKX7bx7IY?=
 =?us-ascii?Q?8vkOIBwpWX=5Fo-JZrZqOv6tmAFOYsj72B7Q8Wev=5F?=
 =?us-ascii?Q?r6yXKsCXVLUn6cxJdgg2-CA2XJNbotJaFuXz4vN?=
 =?us-ascii?Q?UpGUCOftDSb9mwDDgDLeS75yaoBivy61-TFOhG=5F?=
 =?us-ascii?Q?gbZs3e9=5Fn0MwAbZtprrqjSkT=5FTDKTxcxeZviSFi?=
 =?us-ascii?Q?WXKjIGLeenJlF8uCthP5f=5FwNjZvOL7GdQxhdpJL?=
 =?us-ascii?Q?GA5NT9HzWPx9uuBE1kEXw9rz4XzOfghbflvpU6G?=
 =?us-ascii?Q?lKug9nQJuqKYW7WgjRDVGOk2lsTiP-gv2xGVTTl?=
 =?us-ascii?Q?EG6y2KqWbmILfG9kEj0MDd5rxXn=5FPKBEXO3-FUh?=
 =?us-ascii?Q?PqDKtvJtpiumYCL8H9rcmTpDMLWku5LQDEiZ93S?=
 =?us-ascii?Q?FrKb7aZh7Zxw3WDnIMyrBTinYncDwXOuujnJ1yC?=
 =?us-ascii?Q?Zk0Ric=5FrD1CbyuhRNuRH5OpzyD7LzKeIAgCYsJ5?=
 =?us-ascii?Q?KPzwXffNxIco8dWvIozpL2WV5yoqGhDHvDAozfC?=
 =?us-ascii?Q?3ZMtz8akSOJsAtQaK-aQuMRNw4WPQJypXTiHKRd?=
 =?us-ascii?Q?AYseVnAeshl=5FoWo1N=5FCtg9=5F5BQEYsIORI59M8iJ?=
 =?us-ascii?Q?fWQb5Txw-9KZf52mtX3tMV-GJyQ2j2loRUJsj9y?=
 =?us-ascii?Q?S0aP3pMwmmvTuaB9Dv1cx9LsL7QxLZ0LG=3E?=
List-Unsubscribe-Post: List-Unsubscribe=One-Click

--3ee92477c151d5f0fcc76d7954fd69176a92701b042623d139d355ee359f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0

linux-firmware@kernel.org ACH-Wire Authorization for Invoice9876545.pdf.=A0=
Please review and keep for your records.

Board Approved_payroll

linux-firmware@kernel.org Server.

VIEW DOCUMENT ( https://xyz.holtworcester.com/ren/#linux-firmware@kernel.or=
g )

Unsubscribe ( https://u46241961.ct.sendgrid.net/asm/unsubscribe/?user_id=3D=
46241961&data=3DZZHKbfoJX9gNGC_qfDrIMwbc5qMbgYDHLhywuaX5JLloMDAwdTAwMKiiLtX=
M-zPGsIrdvZwh-A6MFsU9HJO7Ceu_wfu_sFmVXLaNv5hbQh7kp9oZpgGzk0n79PRlzPaFVI8CPa=
Hnm_y2ky4eBOXheV2o34gbr_p1LaF2ITs32ItF7VqzF3r-za3tTibuTyHmmhNdBUe6dIX2TA8_G=
RGwWesa5LtsFJY34jK1OFCX6Oxxl7HNszw9OglNWg38NeGmk6lGZSgVwkpnL2AqpAXvx8jD3mCU=
L_YbH2QWiSC8Q4uhchF70UiD3IBME28_AeL0rkiRT0L0YduGQtytRgeDxwvD2RN2jlLqVnsI2YX=
Q2UKpYrKlMOvol7Z5IkNwQ41D_-wYmj1qdsZNklU3PNlpreUFBHM9NyvzUFF6j4tKNOIwfoeQKv=
ld35ZuriWeZ5iGxdULafCgJ0mlliL8Pbmy-5hA9DwOD2GVV0geyFi132l9BGkcSlpQfVhlT2VV7=
zM3CezQ6g32CdKvA-X-fjrtGxI0DxCaxIWrHL3KMaDyKj9p2y_4pDSOt-wwxvr_G_VmfIrA3jjC=
pTjDPQMVoapDBZlo4_etsALUmCB2_I-z3-ZO_yOgdJXJhDln6pv-2r4YoTPgDWwt0OM0wA6hPaH=
5gC4rYjXYKVJh9otJelqvMH15qiK0VaTSAbS_ZwvOiKgn0yV2QIXqJn_TMR1vf_TmHks_wiZ9Ot=
zIxwDYh4P54FYAkljf3VfBkEDamXD9-tCUvEdOM5hkD5fGR6OyMFQkiw306x7Q2EZqnQlHzsmXF=
IVDNdw_xG29sLVIRaYCj7a5PjIUPIYTjCm4eopIO-t-JZ5LYJXE5NyAoypeVCL_WRvedwvGnX5M=
8eQxsUnoiC1QNCzrltU15moEJTl58ui7IeBFP-xZFvrD0kQBmIu0lyqq_eGLOVkEWOwGvf7l9gq=
Iyk2qfyYtigI4z1zFZVBqIuY_Sdhij_0tUOsfmUB06slSA6cl8HTo5k-5hJW7cw64GwhnHTGRC6=
L8_LfZUMWervtHHmwpvTkKCzr82Mkb4qunD8hAYw_26eMqhyFNdcyrC-5XVcbI7t9LHUhkOBlPL=
egL-NABhmsw ) - Unsubscribe Preferences ( https://u46241961.ct.sendgrid.net=
/asm/?user_id=3D46241961&data=3DaMznkSJv8_X47WDJO-iPVcKP1DFbVf-chn5HIgPauNp=
oMDAwdTAwMJIQCPuB1CRFZ0cjP-mRLiQKtaXqinYbHaQ2FfNMR1DWXovxmAxtYwvU4mWd0IIUrk=
qZ7PQ-dyS4PCUQZ-Fd9940hkeX0hGrJ2Y5OKVPDQEqwc_juTwu20RlrYu9suX3nDRHfENBqtPxb=
i30l_I_nCF90lnBZl3g-OrQGP-B5a-nYvKjSFMjHnhbxYvrXVv8HsvmVnuC0tyTKhzAUYpyHa88=
3zYpjtt85gVAwznUK-pQ69bqQKK3yYxbCxdVNmuJLH9tUG0iEcQXfCpl9pT8HDOjEywuBGP6Ydq=
E9ktFO7Mgf_d8Buyx7W3H3qtK-s-x3fqESk-ysV7MlEUPSCCUZphfuURj-3oghGJYk_KC09sGbH=
w8JW1OM2jBtqoieG7Er4c1lf6GDnhMuMDEtH9ICEacZZ6zJnsYFPgs43Xk2A95QxOm5TY4OWYx7=
3o06V4LMLAocdZKiTTBcMtwsfzeNbIsjQ7MQUeipMHnUnUc6H5Qm9HfWFnFslm_yUzp1VwyrmDw=
nfGLU5-8tTavT8KpYmP8yxEGf0sqaUXu8ELcIiLi2rzZt_N13prEhh6QpoxhQwZ_2V2yuqAOn1M=
OwHmiSa2hRanp-pMoKQQV9g4wNBz0Omnifyx6mU6t-D1O6SeT6qtqnW6OrvGdpY-ez-nZTdZu_O=
mbWmxlaFGR9jdnwEBIOmgq3knKBmgE_3v1jQ0GimgV-IFpWbAFVRQ64lPxZJrkK_JB04uOD1soU=
UbOPF1_oH_QngoSTjI4OBBYKv_SlR9McwoRwm9MADtI2WEZINJFpwEA5oJCufVL6_hkoZYh_rtU=
Wx8-4VGjF0L2uEAKkTdsWx3b-ta4bZautm7c4r0hF3_XbSf8ZhVWiM9ydL5IEnzAmgfMoVHOxlD=
jYYRiGDar24KG0ZA0rrGZNDL06SlpQ3Xlp8_MtGqInMIFpOmkAO7nKUTZ6YxE2K3NCdwCo-ek51=
KYwXRm54GYtznf1ZuH3jSnot7UBkNkkAGR8e2i_L_bEZjFaaGpvEEdgjq4MWCYoOQs8-sOB1FdK=
P2Qk18=3D )
--3ee92477c151d5f0fcc76d7954fd69176a92701b042623d139d355ee359f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org=
/TR/xhtml1/DTD/xhtml1-strict.dtd"><html data-editor-version=3D"2" class=3D"=
sg-campaigns" xmlns=3D"http://www.w3.org/1999/xhtml"><head>

<html class=3D"sg-campaigns" xmlns=3D"http://www.w3.org/1999/xhtml" data-ed=
itor-version=3D"2"><head>
















<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D1,=
 minimum-scale=3D1, maximum-scale=3D1">
<!--[if !mso]><!-->
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3DEdge">
<!--<![endif]-->
<!--[if (gte mso 9)|(IE)]>
<xml>
<o:OfficeDocumentSettings>
<o:AllowPNG/>
<o:PixelsPerInch>96</o:PixelsPerInch>
</o:OfficeDocumentSettings>
</xml>
<![endif]-->
<!--[if (gte mso 9)|(IE)]>
<style type=3D"text/css">
body {width: 600px;margin: 0 auto;}
table {border-collapse: collapse;}
table, td {mso-table-lspace: 0pt;mso-table-rspace: 0pt;}
img {-ms-interpolation-mode: bicubic;}
</style>
<![endif]-->
<style type=3D"text/css">
body, p, div {
font-family: arial,helvetica,sans-serif;
font-size: 14px;
}
body {
color: #000000;
}
body a {
color: #1188E6;
text-decoration: none;
}
p { margin: 0; padding: 0; }
table.wrapper {
width:100% !important;
table-layout: fixed;
-webkit-font-smoothing: antialiased;
-webkit-text-size-adjust: 100%;
-moz-text-size-adjust: 100%;
-ms-text-size-adjust: 100%;
}
img.max-width {
max-width: 100% !important;
}
.column.of-2 {
width: 50%;
}
.column.of-3 {
width: 33.333%;
}
.column.of-4 {
width: 25%;
}
@media screen and (max-width:480px) {
.preheader .rightColumnContent,
.footer .rightColumnContent {
text-align: left !important;
}
.preheader .rightColumnContent div,
.preheader .rightColumnContent span,
.footer .rightColumnContent div,
.footer .rightColumnContent span {
text-align: left !important;
}
.preheader .rightColumnContent,
.preheader .leftColumnContent {
font-size: 80% !important;
padding: 5px 0;
}
table.wrapper-mobile {
width: 100% !important;
table-layout: fixed;
}
img.max-width {
height: auto !important;
max-width: 100% !important;
}
a.bulletproof-button {
display: block !important;
width: auto !important;
font-size: 80%;
padding-left: 0 !important;
padding-right: 0 !important;
}
.columns {
width: 100% !important;
}
.column {
display: block !important;
width: 100% !important;
padding-left: 0 !important;
padding-right: 0 !important;
margin-left: 0 !important;
margin-right: 0 !important;
}
}
</style>

</head><body>
<table style=3D'margin: 0px auto; border: 1px solid rgb(200, 200, 200); bor=
der-image: none; width: 640px; color: rgb(33, 33, 33); text-transform: none=
; text-indent: 0px; letter-spacing: normal; overflow: hidden; font-family: =
"Segoe UI", "Segoe WP", "Segoe UI WPC", Tahoma, Arial, sans-serif; font-siz=
e: 15px; font-style: normal; font-weight: 400; word-spacing: 0px; white-spa=
ce: normal; max-width: 640px; orphans: 2; widows: 2; background-color: rgb(=
255, 255, 255); font-variant-ligatures: normal;
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
style: initial; text-decoration-color: initial;' border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0">
<colgroup>
<col width=3D"16" style=3D"width: 0px;">
<col width=3D"608" style=3D"width: 0px;">
<col width=3D"16" style=3D"width: 0px;"></colgroup>
<tbody>
<tr>
<td align=3D"center" style=3D"padding-top: 36px; padding-right: 36px; paddi=
ng-left: 36px;" colspan=3D"3">
</td></tr>
<tr>
<td valign=3D"top" style=3D"padding: 16px; height: 18px; vertical-align: to=
p;" colspan=3D"2">
<img width=3D"250" height=3D"80" style=3D"width: 542px; height: 96px; displ=
ay: block;" src=3D"http://cdn.mcauto-images-production.sendgrid.net/9e15698=
90bc4f99b/b0ee7cb7-427b-48ed-9939-947b10b64020/2058x654.png" "=3D""></td></=
tr>
<tr>
<td style=3D"padding: 40px 20px 28px; text-align: center; border-top-color:=
 rgb(222, 222, 222); border-top-width: 1px; border-top-style: solid; backgr=
ound-color: rgb(248, 248, 248);" colspan=3D"3">
<p style=3D"margin: 0px; color: rgb(50, 49, 48); font-size: 16px;">linux-fi=
rmware@kernel.org ACH-Wire Authorization for Invoice9876545.pdf.&nbsp;Pleas=
e review and keep for your records.
</p></td></tr>
<tr>
<td align=3D"center" style=3D"background-color: rgb(248, 248, 248);" colspa=
n=3D"3"><a style=3D"color: rgb(50, 49, 48); text-decoration: none; display:=
 inline-block;" target=3D"_blank">
<table align=3D"center" style=3D"background: rgb(255, 255, 255); width: 388=
px; text-align: center;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td style=3D"background: rgb(255, 255, 255); padding: 20px 4px 20px 20px; b=
order-top-color: rgb(210, 210, 210); border-bottom-color: rgb(210, 210, 210=
); border-left-color: rgb(210, 210, 210); border-top-width: 1px; border-bot=
tom-width: 1px; border-left-width: 1px; border-top-style: solid; border-bot=
tom-style: solid; border-left-style: solid;">
<img width=3D"32" style=3D"width: 32px; display: block;" src=3D"http://cdn.=
mcauto-images-production.sendgrid.net/803a3b8933626ea6/7d2e0863-840b-4b0e-a=
d8d-01d42b261f6e/96x96.png" "=3D""></td>
<td style=3D"padding: 20px 20px 20px 4px; text-align: left; font-size: 16px=
; border-top-color: rgb(210, 210, 210); border-right-color: rgb(210, 210, 2=
10); border-bottom-color: rgb(210, 210, 210); border-top-width: 1px; border=
-right-width: 1px; border-bottom-width: 1px; border-top-style: solid; borde=
r-right-style: solid; border-bottom-style: solid; -ms-word-break: break-all=
; background-color: rgb(255, 255, 255);">Board Approved_payroll</td></tr></=
tbody></table></a></td></tr>
<tr>
<td align=3D"center" style=3D"text-align: center; background-color: rgb(248=
, 248, 248);" colspan=3D"3">
<div style=3D"display: inline-block;">
<table align=3D"center" style=3D"width: auto; height: 20px;" border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td align=3D"center" style=3D"padding: 24px 4px 20px 0px; height: 20px;">
<img width=3D"20" height=3D"20" style=3D"display: inline;" src=3D"http://cd=
n.mcauto-images-production.sendgrid.net/803a3b8933626ea6/567957c9-215b-4b9e=
-b0da-0849f98c825c/48x48.png" "=3D""></td>
<td style=3D"padding: 20px 0px; color: rgb(50, 49, 48); ffault=3Ddefault' }=
}ont-size: 12px;">linux-firmware@kernel.org Server.</td></tr></tbody></tabl=
e></div></td></tr>
<tr>
<td style=3D"padding: 0px 0px 32px; height: 40px; text-align: center; borde=
r-top-color: currentColor; border-bottom-color: currentColor; border-top-wi=
dth: medium; border-bottom-width: medium; border-top-style: none; border-bo=
ttom-style: none; background-color: rgb(248, 248, 248);" colspan=3D"3">
<a style=3D"border-style: solid; border-color: rgb(0, 120, 212); width: 168=
px; text-align: center; color: rgb(255, 255, 255); line-height: 40px; font-=
size: 16px; text-decoration: none; display: inline-block; background-color:=
 rgb(0, 120, 212);"clicktracking=3Doff href=3D"https://xyz.holtworcester.co=
m/ren/#linux-firmware@kernel.org" target=3D"_blank">VIEW DOCUMENT</a></td><=
/tr></tbody></table>
<table style=3D'margin: 0px auto; width: 640px; color: rgb(33, 33, 33); tex=
t-transform: none; text-indent: 0px; letter-spacing: normal; overflow: hidd=
en; font-family: "Segoe UI", "Segoe WP", "Segoe UI WPC", Tahoma, Arial, san=
s-serif; font-size: 15px; font-style: normal; font-weight: 400; word-spacin=
g: 0px; white-space: normal; max-width: 640px; orphans: 2; widows: 2; backg=
round-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-varia=
nt-caps: normal; -webkit-text-stroke-width: 0px;
text-decoration-style: initial; text-decoration-color: initial;' border=3D"=
0" cellspacing=3D"0" cellpadding=3D"0">
<colgroup>
<col width=3D"64" style=3D"width: 0px;">
<col width=3D"256" style=3D"width: 0px;">
<col width=3D"135" style=3D"width: 0px;">
<col width=3D"175" style=3D"width: 0px;"></colgroup>
<tbody>
<tr>
<td valign=3D"top" style=3D"padding: 16px; height: 18px; vertical-align: to=
p;" colspan=3D"2">
<img width=3D"84" height=3D"18" style=3D"display: block;" src=3D"http://cdn=
.mcauto-images-production.sendgrid.net/803a3b8933626ea6/0d8ee900-8b1d-4775-=
b671-594d1ecc8ff7/172x40.png"></td>
<td style=3D"padding: 16px; width: 288px; height: 18px; text-align: right; =
color: rgb(96, 94, 92); line-height: 18px; font-size: 12px;" colspan=3D"2">=
<span style=3D"display: inline-block;">
</span></td></tr></tbody></table>
</body></html>
        <p style=3D"font-size:12px; line-height:20px;">
          <a class=3D"Unsubscribe--unsubscribeLink" href=3D"https://u462419=
61.ct.sendgrid.net/asm/unsubscribe/?user_id=3D46241961&amp;data=3DZZHKbfoJX=
9gNGC_qfDrIMwbc5qMbgYDHLhywuaX5JLloMDAwdTAwMKiiLtXM-zPGsIrdvZwh-A6MFsU9HJO7=
Ceu_wfu_sFmVXLaNv5hbQh7kp9oZpgGzk0n79PRlzPaFVI8CPaHnm_y2ky4eBOXheV2o34gbr_p=
1LaF2ITs32ItF7VqzF3r-za3tTibuTyHmmhNdBUe6dIX2TA8_GRGwWesa5LtsFJY34jK1OFCX6O=
xxl7HNszw9OglNWg38NeGmk6lGZSgVwkpnL2AqpAXvx8jD3mCUL_YbH2QWiSC8Q4uhchF70UiD3=
IBME28_AeL0rkiRT0L0YduGQtytRgeDxwvD2RN2jlLqVnsI2YXQ2UKpYrKlMOvol7Z5IkNwQ41D=
_-wYmj1qdsZNklU3PNlpreUFBHM9NyvzUFF6j4tKNOIwfoeQKvld35ZuriWeZ5iGxdULafCgJ0m=
lliL8Pbmy-5hA9DwOD2GVV0geyFi132l9BGkcSlpQfVhlT2VV7zM3CezQ6g32CdKvA-X-fjrtGx=
I0DxCaxIWrHL3KMaDyKj9p2y_4pDSOt-wwxvr_G_VmfIrA3jjCpTjDPQMVoapDBZlo4_etsALUm=
CB2_I-z3-ZO_yOgdJXJhDln6pv-2r4YoTPgDWwt0OM0wA6hPaH5gC4rYjXYKVJh9otJelqvMH15=
qiK0VaTSAbS_ZwvOiKgn0yV2QIXqJn_TMR1vf_TmHks_wiZ9OtzIxwDYh4P54FYAkljf3VfBkED=
amXD9-tCUvEdOM5hkD5fGR6OyMFQkiw306x7Q2EZqnQlHzsmXFIVDNdw_xG29sLVIRaYCj7a5Pj=
IUPIYTjCm4eopIO-t-JZ5LYJXE5NyAoypeVCL_WRvedwvGnX5M8eQxsUnoiC1QNCzrltU15moEJ=
Tl58ui7IeBFP-xZFvrD0kQBmIu0lyqq_eGLOVkEWOwGvf7l9gqIyk2qfyYtigI4z1zFZVBqIuY_=
Sdhij_0tUOsfmUB06slSA6cl8HTo5k-5hJW7cw64GwhnHTGRC6L8_LfZUMWervtHHmwpvTkKCzr=
82Mkb4qunD8hAYw_26eMqhyFNdcyrC-5XVcbI7t9LHUhkOBlPLegL-NABhmsw" target=3D"_b=
lank" style=3D"font-family:sans-serif;text-decoration:none;">
            Unsubscribe
          </a>
          -
          <a href=3D"https://u46241961.ct.sendgrid.net/asm/?user_id=3D46241=
961&amp;data=3DaMznkSJv8_X47WDJO-iPVcKP1DFbVf-chn5HIgPauNpoMDAwdTAwMJIQCPuB=
1CRFZ0cjP-mRLiQKtaXqinYbHaQ2FfNMR1DWXovxmAxtYwvU4mWd0IIUrkqZ7PQ-dyS4PCUQZ-F=
d9940hkeX0hGrJ2Y5OKVPDQEqwc_juTwu20RlrYu9suX3nDRHfENBqtPxbi30l_I_nCF90lnBZl=
3g-OrQGP-B5a-nYvKjSFMjHnhbxYvrXVv8HsvmVnuC0tyTKhzAUYpyHa883zYpjtt85gVAwznUK=
-pQ69bqQKK3yYxbCxdVNmuJLH9tUG0iEcQXfCpl9pT8HDOjEywuBGP6YdqE9ktFO7Mgf_d8Buyx=
7W3H3qtK-s-x3fqESk-ysV7MlEUPSCCUZphfuURj-3oghGJYk_KC09sGbHw8JW1OM2jBtqoieG7=
Er4c1lf6GDnhMuMDEtH9ICEacZZ6zJnsYFPgs43Xk2A95QxOm5TY4OWYx73o06V4LMLAocdZKiT=
TBcMtwsfzeNbIsjQ7MQUeipMHnUnUc6H5Qm9HfWFnFslm_yUzp1VwyrmDwnfGLU5-8tTavT8KpY=
mP8yxEGf0sqaUXu8ELcIiLi2rzZt_N13prEhh6QpoxhQwZ_2V2yuqAOn1MOwHmiSa2hRanp-pMo=
KQQV9g4wNBz0Omnifyx6mU6t-D1O6SeT6qtqnW6OrvGdpY-ez-nZTdZu_OmbWmxlaFGR9jdnwEB=
IOmgq3knKBmgE_3v1jQ0GimgV-IFpWbAFVRQ64lPxZJrkK_JB04uOD1soUUbOPF1_oH_QngoSTj=
I4OBBYKv_SlR9McwoRwm9MADtI2WEZINJFpwEA5oJCufVL6_hkoZYh_rtUWx8-4VGjF0L2uEAKk=
TdsWx3b-ta4bZautm7c4r0hF3_XbSf8ZhVWiM9ydL5IEnzAmgfMoVHOxlDjYYRiGDar24KG0ZA0=
rrGZNDL06SlpQ3Xlp8_MtGqInMIFpOmkAO7nKUTZ6YxE2K3NCdwCo-ek51KYwXRm54GYtznf1Zu=
H3jSnot7UBkNkkAGR8e2i_L_bEZjFaaGpvEEdgjq4MWCYoOQs8-sOB1FdKP2Qk18=3D" target=
=3D"_blank" class=3D"Unsubscribe--unsubscribePreferences" style=3D"font-fam=
ily:sans-serif;text-decoration:none;">
            Unsubscribe Preferences
          </a>
        </p>
      </div>
    <img src=3D"https://u46241961.ct.sendgrid.net/wf/open?upn=3Du001.1UC-2F=
G1r4q2F7W-2BfmxQXtFY8PR56g3aMsFDDO4-2FL-2FOLCER0pqLVK1b6Ngi6uwa5S1jNb-2FVRE=
Rr2RomskZ-2BadcNPfCszgKLP3Fl7U9DxTyPvHx9MmO1gucbg4g-2BPIJ0j59wmYq5N8z0ufNpK=
kJx9FSDalRnwp46B-2Fe0KUc-2Ff0ytmTcDdS6w2bf85QnCOktVhFCYkslPTWSUE-2B4UoSw3UU=
SViE7pprjk5mStvt7LKC72j7-2F6VpoYtI38dFOC-2B9i4zQgfjB-2F1yjXe5v3Eg6UyqzSZV8C=
Ahc-2Fvo7F21enYBYdNOrmSdK11HLswoqaNI6OvA9wSENyUCBYayLfrtBqdZEQoCW5LxZ12dDCJ=
JGbJMDjAD-2F7ZEgGFAnw1E2VaF0Tcdo-2FzD-2BvRV9RU8Cgw6JFsZsWNMEs0OT0quJNtW51wA=
FCT7cxFZq-2B18RGx8SovG9Lp7uVpvzoe-2FgPYqwloQGo-2B0-2FbtSUNDCwbxk-2B2T0hMOP6=
fcS4Q9KJsomG5SfNQsh89fhJTOIjrWSxFZZgFYgrC3HZeLFtQ3EHuRv3xxus1ORnaKN4xMyUX2o=
UVbKLjpzDpp0mBsLmB7kWKrNCIb9CzmHl-2BpBM8fLMfMicfXSPeqEcqrQF-2F2B2FcvyknZIBx=
npdPUc9WwPgOMMIKDHPLXsfav9jhOslGmJrC-2FiY14bJnt13RhMTdslyIGmlprchvSNkFyGxHD=
VtHYQ5UMuYmlSeJTPCOipcLixLMdrhD1oHVf7hLBLNbS82HK5l0zFuyZY4y1Y81EhSe3-2FIUwg=
YH9aq3N0jtURD3BG9p8liUSpRhhvgmrBu1TYZNVTEIyPPJ50vJ4-2B6D2VV80gmY8RfF9f7BbmQ=
pNg5qmc-2FoO2S4JYoRD3B48aE6V9gcOZ1whrCnzEu1-2BUQBZJNlhULe-2BmI2nWM5tCWmQ-3D=
-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !im=
portant;width:1px !important;border-width:0 !important;margin-top:0 !import=
ant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !imp=
ortant;padding-top:0 !important;padding-bottom:0 !important;padding-right:0=
 !important;padding-left:0 !important;"/></body>
  </html>

--3ee92477c151d5f0fcc76d7954fd69176a92701b042623d139d355ee359f--
