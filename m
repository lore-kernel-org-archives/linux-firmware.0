Return-Path: <SRS0=1Q+e=H7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0D9CA9EBD
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 13:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E6171F000FF; Fri,  9 Oct 2026 13:08:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791551313;
	b=coHoWfns6PdXGCgFS7er12n/rBHEZl0Fv96emnbyeMG3yX0Wy9xH2z07xTHXUEW04cTf
	 YnIV8V94mhoAGtmn/er9ga4YeXSNv5fN7UQdgJIofw78rU3Uq759sxyRjKvvjb6xs7HHS
	 FmukNYyDNMiBzVTbIrowPmU0VDrPlMO+qVJ9ci2WnnTJvVICj+NDtKWhKEZV+FLCU9mri
	 dgiVN6JcLRx/ymTFYx1OLPq5a4JwGzhr0r3zcghOTIxryZzsbynM10ICqJTarwSbNBYaQ
	 26R4+9Dd+Tnd9OL/0ejvb6y0v6wsX9vFq4LaFYODsojEvKVjR5nu1O5lnJ9/YFGIfgg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791551313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LHSJZnrBHslU8hThP050uLR9Fs5KZLtUQuVrQvqnhlg=;
	b=AdX60/6bFu7kqMcJphsByFVUp9I27zYRyYj2E0k++P5mCsj+TNCGbPqiyiBSIAWqmvsD
	 RFrp1/Xv7ZXWFmFKQ9e4bqjIsnBmVqL7WCLREnKcTazt3jqmcjjSVprucgJOi4xt6f7f4
	 nT94r6Ij4/otUkoFi4XkYYNKx2JBR9oXoTLS9LMf0nA4IhUf1Ufb4q/coB2G1X3adkYSG
	 E8hcCFpfHNeabHp5/OZTZ4oW+DX+5pdclJ6Hec8H7q3SdPvRYuxm+6ZlhRItKR1G/7bM3
	 x5hr87GW+yzKasS5XAEEQctW+8gTEt8Wm5dsjWhCIsnBVsv/xe1NdnjcNegOpHgqY5w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SOm4YzO1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Me6COomb;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF6461F00893
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 13:08:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SOm4YzO1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Me6COomb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DF6461F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KJwZ1746882
	for <linux-firmware@kernel.org>; Fri, 9 Oct 2026 13:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LHSJZnrBHslU8hThP050uLR9
	Fs5KZLtUQuVrQvqnhlg=; b=SOm4YzO1bvqp0639DkUQQRbjYHT+X/JGIZUtF9Qh
	I0p/b8A7R3uVArl6i7t84d1r4iKpwR1Rf6OWcp5PGI9RiwrjTyYbyS460tVSK8Ti
	fTV8ZyFsynxluZEl6ctNArmwr3kVYpie+lL0tteUt+B4B2GDaHWzC33lbkRD5lEM
	iGmTMiiEvgTJR4gDY7POKqyeGnRkp0OqcAOpjLQPz4Vpm9xTJkxgTYiSrAURgCQr
	r0qv7dwxgeJL72VOIXFLcEUP/YdZ1h4MJ7r/0GjdacrJgkczpP/ghHimkq96Ds/e
	xRXuR0IPqiy47+/n9ReWs36adlXLH+9qsdwl99Odng349g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvby72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 13:08:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso4575135241.2
        for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 06:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551311; x=1792156111; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LHSJZnrBHslU8hThP050uLR9Fs5KZLtUQuVrQvqnhlg=;
        b=Me6COombrypLAZWbZldKJSbbs5wHnJRkmiBCBBAEZXM+ADlIFJ/k29y5z3U2QU/Hvd
         2Xl7NMROcOSRm5AZcfiwqpkUy0+nWzbtJS1e+m96Pw8oxOvJifWo3C43rS/1uf0nHnbZ
         46ufWF2T5sQGB+XwAOqZV4gNKCsDaHcevTrqU+8IHOzonUFbBezQOnQRBKPavrlBMuxn
         A8h1pU7gAjNgTPQ+8eAjxfLBl43oI7kVbH7EHScMUkyS5hkJ/7mhY+249TkkEbbiZ42T
         GktAqN7epCEr14Ncq+7BzvDX+UC9mb7yvIuzX/NPrmDSrCTLOsuun4wPgziPrc/KBTGh
         e4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551311; x=1792156111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHSJZnrBHslU8hThP050uLR9Fs5KZLtUQuVrQvqnhlg=;
        b=Cx4/RYmaVprb0vXJhm9puV/Fyou7DC3DhrPItqYGXbQd3ZGDwSQoa9rur+GgSaa475
         6HNPJhemD2uAFRFxvv/emAKjgRY+jceaanJFNFwcpBXXCjkHTn3q8xZf5dQOwrI+MKC3
         tKPns+bU7yCZMLgB5Ir149vMbPhPWGHSnw6a5W0NNeyK5dXKJ/hx+Y0Mj7E8C+yKqj2d
         V3Yyo2G8FS9bziN+CJ50PwUOMnhn8YbTIBlummCzzwq+uOdaeEfZYX9fYZGtqvA6bZzI
         5jwv40YKNsE5p31SVYemyhsa7/E2/vucdn0Oq6sF55doCnqfqzmrF8ZFlyxqPLx/TyEH
         22Sg==
X-Gm-Message-State: AFq9FYJpmDh/GZs+wuVxPRXwD0/u25ozJmqHe6HMaZL4tQM+o/fLokQr
	0UQP1gpr9bS4WTDNLCfRAqPGeScmXOq/C+B5pKFke9f1vZvdJDoDb/dLuMbi/XtidgiThxeTg7r
	aUz8yPiAHiQtt67gmDgRQFywI2EMU4kMuxijO/hWoDyrUmbSO5FO4D+eE+MGob6f85V1eT2HzCA
	==
X-Gm-Gg: AYBFou2H9a/ju6ZxVj44wS6rmdClKuTZ2vTqFKhjoTqdvcTbL8Bf6zTHZ6S91dUnUx/
	cL7wLV9upCfCfUsozGSP1ORvbDAZQbRE4JWL3T1MBdcAmJrAMrxete4Mvvspz7VMs/cK/feQPbm
	q+WTZOpggPzuDF6MJXgl6OByYeYeG1IGVeVd+AqK4l6uN7T8Yx4TGi/qTrDVKNoa5KTop4S9FnM
	MTHXLAHBS1/Elq129Z2YzB8D0XMtwHXkyq+6RS7VumvA7lHqgyuiUxCaJqLkkuFmwN5ERpkpUVP
	fpSlgB2N3xBSqYCiZ53sDk+/PvxN9cXQspe3Wnz0Z/DHsslfF5xJH2j4iVBmRZOhSeaVb33TJfj
	XkIjZfmUWqRqsfmw7fFTFp1v0crD8RnpihmolmNCi3lql+YhzzngWAGzonNFNt2WwWe9x5IG49J
	IOoYHOl6431kWk
X-Received: by 2002:a05:6122:d1b:b0:5e7:8bd1:731f with SMTP id 71dfb90a1353d-5e91f4815a8mr586569e0c.10.1791551310890;
        Fri, 09 Oct 2026 06:08:30 -0700 (PDT)
X-Received: by 2002:a05:6122:d1b:b0:5e7:8bd1:731f with SMTP id 71dfb90a1353d-5e91f4815a8mr586533e0c.10.1791551310339;
        Fri, 09 Oct 2026 06:08:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea85a6sm619472e87.57.2026.10.09.06.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:08:29 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:08:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update HPASS firmware for nord platform
Message-ID: <wc6pbbqet76yquevnlbou7igq2ge4zp2xtgnjshgu2cuv3dzid@ec6wkouipgox>
References: <9a5d20e3-c72c-4c55-b4a6-87a5b107e9ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a5d20e3-c72c-4c55-b4a6-87a5b107e9ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: t9Vfnp9aLlU3U2bzJYJkWuX5_bzLtb8f
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8e74f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=vyXeGSww8-Bjh3moARYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX+cpwtT6J0J9+
 TCloL8ZfiMaXEUwuQ6bJjrTUwPZU8v08Nt9DOq8xCBVNE8zlyCGsPuPdOyN0DQCiYxO0weHG5+a
 QaK8ZHKxSJnvYpIdPnHMsyogVEh9QmB7hG2R/9rP12LkEspzvmYvVsQEm3iQpUjkOgZaI/C7Ph4
 /5IBcsMWktksxnTWx8ZOgBtgSzfczJRh2i6pCgCwUipQR0yJgvwK9rT6gIs5cGuHtje6KBdFVuT
 6NGuRXoB+hYUbkxhATGJ0j8PNZklePgYqLc/G2Hr36WiVbiL9VRNZZ8ZoWZp5pxEd625361eBEz
 dfsd4VccJAJP+NJQFJc+L5aBf4+nEZx9E0CFjublXPw/wL6M92yJacv9FS7dg9+8wUkJRBM1aO0
 ou7MS/8qfE7+2inAc14uPMD+BWCGPmGZooiLvgGuisfH5DTC4+qLL2M6qlxkw2wzFx1qHS+B0F0
 QUBoJhsUF2fm0TEsIJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX0uT5VEetoVB4
 aYavTamEIekH0qfCBLa+wZZe4n2oxHbs+eSWPFq2h1Hjdf7x6ippoi/b2xjm+utUSPR3LMHnGed
 Ox2kAzgWlg/VP4NxJw7FhgPGqZb7q0Y=
X-Proofpoint-GUID: t9Vfnp9aLlU3U2bzJYJkWuX5_bzLtb8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

On Fri, Oct 09, 2026 at 02:27:20PM +0530, Saddam Patan wrote:
> The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:
> 
>   Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-hpasslatest
> 
> for you to fetch changes up to 10a0d758cd7005f323b907061ce09db5dec7ccb3:

You haven't pushed (or have force-pushed) the branch. Now commits don't
match.

lfapply.sh: error: fetched 898bcf4ac1e4dbaf40ffebe12d56890c4e2ea856 but
the mail asks for 10a0d758cd7005f323b907061ce09db5dec7ccb3

Saddam, please be more careful. Please verify your commits and send a
new PR.

> 
>   qcom: update HPASS firmware for nord platform (2026-10-09 13:18:04 +0530)

-- 
With best wishes
Dmitry
