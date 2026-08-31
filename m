Return-Path: <SRS0=EM2Q=GY=oss.qualcomm.com=shuai.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBBEC61DD3
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Aug 2026 08:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F53D1F00A3E; Mon, 31 Aug 2026 08:46:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788166005;
	b=fKxA4KumjqAeSuWlbz3LMdE8bzWXhf9fuNbAgHaxAxVl62dFnGZ3DGmwB7KPiVclfxA0
	 tzPqstM4/qd1aXd26BC8QMK9zLhuTy6IdcmGPbO3FMImYdLM+2kUUDRte2Ihsh2CV1bZ3
	 /+v+Iv/t64hqTFYkFNOYkCr/JI3DS2J/e44Qfc6IWxYIzJMKU69y4+hkMOiNIAq65gA6h
	 qFt7oGNXeLgBNzhmUP5i0L2fy1od3KCmdQIuy52DZkd/FhoLb+71gFsivNkZqjFtqSJdM
	 f75TOGQTK7fVVGzM9W1mW66jGa+6ecGPGv8FxsN6ROHG6yQBkcCPdQ+n6cFxyG2mjjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788166005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XgQzngo/0o44GeGnvqpydjjmSyOpV02vSWXDcUvigwg=;
	b=Iq67QkfP2/YBcia9S7eoAtFkoHXYv68BHc+WxJ6RQEBuF3Q+585zr3yhXN45QGr1CERP
	 u4GJpeyEJGSqiwBDwI//Pc+G11MF11kbD0KEGTvyJvyDm3kT2YFkkBhz0EUsatsVccSF2
	 hm4E3nvkBvuzlrN6whvyLEqLDPvLHrCygmDJTm6ksUI1aBhVmkFacnnYRRYiVS0UOC0s6
	 2lmJKCFqI4+W2xJZS4EizcttsKSh/0xDSj27siU0RjmX/abvHd407UZhK9feoj4TT8NQk
	 mk/X7+OyCdCO+6espDhUxfpdPxl09TrBhmVGAaYApByaOwSxUBkwr8wuxQ9bD5g/JCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GN2Q2f4n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AqQHG29I;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68F031F000E9
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 08:46:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GN2Q2f4n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AqQHG29I
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 68F031F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xaNC3427321
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 08:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XgQzngo/0o44GeGnvqpydj
	jmSyOpV02vSWXDcUvigwg=; b=GN2Q2f4nU4g6fY5Hk66RuEGqA3YrZrVgOeyTsi
	1+i2jebKYhJQ5FgHtULYV+qkQsgDLa7aylhbnHEuAfJeAyqZpun3+sy4eejwUz9s
	iTko7t04BVxx+Hy7Y6uH9EkOKX+DdX+sNDwffnWijsJMrZ75mYnVEyvClhrqDmao
	m9YNJWteV4qgY3nLbLwdknttGMuywPezS5J9S/RTZla5hIZ+m7JzgMqbFntkThxx
	xbNXfwKTTHkxhzy18VgQXxTVNdZ+np/abNYzjB+ijhrcWEvQlIvgWSil5J4/u3P9
	05MSbzGAOKeD1Du8u06S7gO7RvUenxTOgXgrhsw5p3FTxikw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm8gd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 08:46:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-85326b426c0so4386597b3a.3
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165996; x=1788770796; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XgQzngo/0o44GeGnvqpydjjmSyOpV02vSWXDcUvigwg=;
        b=AqQHG29I8XEfN4Kd3mvdBFnc6hYJ31u/CRnWIuBGE+fdVBT8x/+Zt3wV2RHyhQMKw3
         wabo/C0Gy/IK8FY8R75HsPRU31Cc9gupLe/HAzjXRo8gZHaHNmGgKudjmE/rc21CJmEN
         XiKNI3yFEkYzSxW9RUE9lOO6GDKZhOdwH5tfZm32HjS3biyDCI62tiSkW3lLj02tzJxX
         D23oEc/g5J8badXC/4PeC9j6CWd5JOqUn2OIL+pw/x2e6cYYVmhl28fY7bwiILtL2Fek
         XDANUKHPUWxnQ53SyWHwLt9fffCQi8DQLBuHQs/haiSdNQw/7+By4gRez01ag5C9rUXv
         n/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165996; x=1788770796;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgQzngo/0o44GeGnvqpydjjmSyOpV02vSWXDcUvigwg=;
        b=Iba3kogjCwkNZNAht4rjRKQpBA+shdFqYs7X4pDhMzw88DF9GCrrHpToz8TYb3FGcD
         6hUPCPzVFo55FQlxJDlgvFEzu/vQNjkpvnKBJhYHzENu9/7aG2YjWCY71JSNyfLr2iPt
         lRxXfbNnHGyuxVOh1+CC06EXneC8a6HOAdPQFVHSJrfL8mE1r35Kn0qgc7XTecFO++Ex
         wC5VaVmyGP19aNsWoA1G8LV36VJhHAQKH+XFSwgOJp9uqz+arFmCfWRlZ2lOGWTDFj48
         kxlOy+Gxvqq1Rtv4bLMORvfT1SFd6pmbwqzR1/9HAkp2CtytEBSpiQn0slA/LSPNngjx
         elGA==
X-Gm-Message-State: AFuF++nF92JXSJsr+RUcQmYEGMH0uGB8V6TLWiINSmg3PUm58YmDdozG
	Giv89jPYO2zf0Ex0824IQSHUzEP0uEJf9SSQEFe+lMVlyjXI4WHWLJ1UMZQMoaLze00g2Fj8sHp
	mNa6sK//8rKOKV466AVe7AiYcFai3YN0frGuyFljUeSFwJHLkwikQeVoaLR+HNIfwGf1sKow=
X-Gm-Gg: AR+sD12wb2/PuiSqsWgC5jnJ9YOb8LMr4tf29RxTWhgfxLpElyGeoWwEOJH/CdtxYW9
	PznuNjHS4ESV6CAOr4W6u6nggcKEiv7njV9nbr/VgHoryzUM9MY3z9lMac5sOIKQOPjysBjynub
	JqmG9UN2GT845+3CbpS4Hm33BEsNT9PqbFQXYXTZKHhvnEqGMXRhqjrYlKH9R48qBn0tWkA8r/5
	F3QM7FvzIqNd3cch2tachx0xEKthFsa1ZSs9afHx4LB3PzlVvPsYOZtIz4v6CvJ31nfu0FaqJ6q
	GfqpTz4kuYYjy0DvFqos83Xah7T+95anwq7Ew75AosagG5dW5wmCy/eeLTC7eTzJ83fix1Rgc8x
	zoEPZtlsKyn64hTWUkxrhke56Ap8=
X-Received: by 2002:a05:6a00:23cc:b0:848:63c9:ee39 with SMTP id d2e1a72fcca58-85adb7bdb11mr2186094b3a.12.1788165996552;
        Mon, 31 Aug 2026 01:46:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:23cc:b0:848:63c9:ee39 with SMTP id d2e1a72fcca58-85adb7bdb11mr2186055b3a.12.1788165996079;
        Mon, 31 Aug 2026 01:46:36 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fa79c1dsm3473484b3a.16.2026.08.31.01.46.35
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:46:35 -0700 (PDT)
Message-ID: <204137ae-e9e1-4ce6-9d2b-006fed541bad@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:46:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Subject: QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00079
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nMedWshEnsuzVTIIp14DDmY2FDYHL3De
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3NCBTYWx0ZWRfXxqhxTk2A3ly2
 0kYzgHGA171h8PzAYjqE1D8tTPomEU98FQ8GyH5c30LmrLsJXdxQZx4oaJiANGF7UEetdADhU5j
 5dUp81G+kez/tf1pMNeA7s8xWXFvAZ2LCRkJbQlFRHu1foF+20e/s/kEvf4JzYyCvRPhACLDlVp
 2hoXy3I1+H6UeYq7uZ7K8pPhKDTeAiG6s0HfO35KoHH4pplHeqJet2jratq/V3280TYfrZv6yZ0
 s5faZJWNAYA2JABcZCvwF+JUfr6TT0FMhakOHcs6BB/JSNBPu4HgBuHG1ehlCkuxGYXUsp1fPmT
 MmlBPkM6ElvIQojn7o37sqeeOcSj/xc+Fh6biaAhSjXBdVtZMcluQ6a5PJj0hCVdeT/xR3JyVJ9
 CxOkTB7E6wXJSsG8E/P4GWxnlq95umrZ2qlFcN+Ejgr6kechbFuqIdh03cyOIsSUFybSi8VrJOk
 z8EQNrpOHoqJJcym82g==
X-Proofpoint-GUID: nMedWshEnsuzVTIIp14DDmY2FDYHL3De
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3NCBTYWx0ZWRfX0r4wPbScdBeu
 ALQ3ALQn4IkHQZxIOw9RBqTEre1Dz3PG6g4JzQAV7E2dnyyZzqVu6LE1Wsx3ws6uFhlMoJeaBnj
 inV0QaOvJs3scAlWt8V6XP1AnbhoeQE=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a953f6d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=ZfgE4unx2aD4J01IelIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310074

Hi linux-firmware maintainers,


Here's a pull request for btfw. Please let me know if you have any problems.

The following changes since commit 6afcbccc10ce54c84fd06ece157a4f767138f898:

   Merge branch 'unparalleled' into 'main' (2026-08-24 13:07:23 +0000)

are available in the Git repository at:

   https://github.com/shuaz-shuai/qca_btfw.git qca6698-2.1.2-00079

for you to fetch changes up to 91a27f7816eae53b20a72892e7cd2e8925d34215:

   QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00079 (2026-08-31 
16:22:44 +0800)

----------------------------------------------------------------
Shuai Zhang (1):
       QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00079

  qca/QCA6698/hpbtfw21.tlv | Bin 167212 -> 167276 bytes
  qca/QCA6698/hpnv21.b206  | Bin 6664 -> 6664 bytes
  qca/QCA6698/hpnv21.b207  | Bin 6752 -> 6752 bytes
  qca/QCA6698/hpnv21.bin   | Bin 6664 -> 6664 bytes
  4 files changed, 0 insertions(+), 0 deletions(-)


Thanks，

Shuai

