Return-Path: <SRS0=Hj3S=EG=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CA1CD98C7
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jun 2026 08:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DFE91F00898; Wed, 10 Jun 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781081425;
	b=ES/euPcO5ir5t6dhzN6drPbPNRBs/ik5O1rnU05r0f/V/tG4ZdrzIImTT80DXD22WP6e
	 mbdh35r3fm5sqIvFGPl4rxkgUjupjz+7lYcJsr0Nowh/KTGOgoKimZDY+Zv/naDNdPBuP
	 WqGNywH4/UsTA+apqjWQri3SL8Z1EW38DetZRLX0W+Zy6tovcN4DeiK83xdao1SdfHuqk
	 HUb3fMkKJ8jSJShM6ZJH1IqE3wiD66lCxbLhj38eTYABGYAOWTv0cqA9T7y8/oHwg2+qz
	 HaVmuvoKpbrROroYPkX1oGnXh3ss3xgTZDAn4u+DflxCCS651zbOElTn1zRN99xcncQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781081425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SV696BFyEGahW1N0MHFRx3WoD+ZKXnzTtwAnRN1OyWY=;
	b=AdRj9gObi3tYrehQbAJ8tfcCoB/ToNZuIJouyMV9ircN4H2UoseAPSeroRZDqaEZs8Fu
	 hBcp2q4KpLb/8w1VrQWpDF8u7ldgjEoaLk7oziYibnHrXZYDLGNXd/ucV4pNAuEqwKajM
	 nVibqjE+MXnsWC57YKDtmGZuZ2iZZmsBskkTaXrEftFMsJhOOwmfgYvmAYky5sw/U/5J5
	 AcalA8qgMdV7JaW+d2TcGB1uqXJZt4BVdwk5Rgbw+4jzwbWruC7teMQblPaZl4lRDTnu7
	 qSy7pG6zcvzbzcsnJdUsHm8FB4BnmQC+5W1Oza9Xwihu5HgB6IRovNmlrBAArmzwNVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZDezv0O0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcvhoaCu;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 584DF1F00893
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 08:50:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZDezv0O0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcvhoaCu
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 584DF1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7j14g947664
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 08:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SV696BFyEGahW1N0MHFRx3
	WoD+ZKXnzTtwAnRN1OyWY=; b=ZDezv0O0EFMyQTA7X72DhC+boYi4Knn5cOrCPq
	h7rYiM5c7WLBG153E2ejVQ9bi5YonoV9V6bfX/c7FHJf1TjkzngaivVmEIRofFMm
	E9TyCyQiGZvl1fTBlP7mVq2yZPt22/DNisiyJywSSlQ0Sp+ZrTHq+2Rlk8RNy5IB
	scckKCDbXRGu7+UoY2bQzxNhPuI2/4l+DRHSjsRO6bAxGWD6M+4/qUr2IUpHb2M6
	7qAyj5ideWLLkyW4/HJ6eSol6s6VjOCoWhvooqTfnOV4vXynQkh7zorUXkWU2VN7
	oKROZ/B4Dnd2s6YT8i2gRsBlFZN6+ZOHO9P7LHQ8/MEQLbtg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnskq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 08:50:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso4116705a12.0
        for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081422; x=1781686222; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SV696BFyEGahW1N0MHFRx3WoD+ZKXnzTtwAnRN1OyWY=;
        b=DcvhoaCuUgcbS/rleF2UGhdlFeRUJFAmBew+IKxWR6VGlbj/OQaGUMxQcZIkosBgPL
         Bfo884u2HcB5gU2eeuCRTkrxgrQNXFkIQIGrPnIz2AIV/W2pC8/jCNDPRXOK1qze5cOH
         boz6nLpMzSvZglIpXP2KKznNRDWd/4+dk85a9FPSFIdFlNUuyUWp1bLVXHrBgfyqNmAn
         ucXsT9PvYVK9aokxqrBFihwL1/pvKTMip2nWiJS5pmo0RHBMJ4wIxAb8k34qBTNAoQis
         47EsykSuldNd917Za7d04WgIj1c1cPqg6f3kTX7bIJ8u6QZGJvt7UF9j+knwKdelJ4P1
         UmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081422; x=1781686222;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SV696BFyEGahW1N0MHFRx3WoD+ZKXnzTtwAnRN1OyWY=;
        b=spjimpM3vMZ5QuuQG2PhW0OTO55XbaPYvepsQMaXM9v/QuboPrySmGkYCcbzD+wUNq
         /SjvhqBoCiDtSHcLLjlQHmN65ktzmFhC6hOymQYZV9x046iLRKwznoUtP3kl19m3T8Qf
         dMeK5k7rJ+4ffnUMfXBmTSSpXeqIoTWoZMP9xt8aTZbf84GRsgaa9J/dUdt/XX1dM5O/
         U+IBFnpeF/lwe3pamN6XMxTyAxe2GIGfN4OyzTVexjK3zNu41U6Uu1HGOt8GlQ5zo6iE
         tgSeoumfcxY8pxLSVpZov/wH1xJST8WTevNq7v5SAhBqXcXzHs98SSWcD74/yScUsssE
         NDUw==
X-Gm-Message-State: AOJu0Yw53xdi5rXIichlENYw+jzryp9nfgN9j52uRfTYYeRCTsyIpsks
	8YBgJ2soXloHGvSuCAj4PVSShIyM1nIrIvGtnlqXXLBawpUprkaNiPSQMoUFqtpnTtQm2WH8gmD
	T/KZPulohu7J5IjHRjTGAb1nx5FD2hdjn8gDhrbtMUMNoLvP58UCXWHv+aPVL7EVXSKusxJs=
X-Gm-Gg: Acq92OHQkkzFBe/lE/MaPCsSxv+1zKO2duJRqv1dNfR7ROObDSJc2VshOhw34vA/RfL
	4EqjJHDNDBjAleNe3ibNfRUBo8XTAvx0fjsW3hCVuKetQmoqN2ReG/0FpokASTdY0vv5zMYjXYz
	26i7IjxAe4fd9lTssNy/t49Zx8qBqO+AO06OAxqGnykBG2xaYUkc8vTRoZXRvYH1QRo0e3EYsSn
	Q45MvCTxQTL8OcEfMr1PEQKckRcXh0jPaLlzb02frkch4Boi9PMLa1siJlFefURc1t4w29D8+n9
	j2lEHkIveJ0g/nqH7AU8dU97AD03VZn8D7V0hOMO5iFS4QFlbMfPpfjLTFBM2sDdySaFCs62r49
	pnKZMbXVsotj/cveu1ImQf3UTYm46PwkgGUtxcKbPi7vFB5wcwCY72kosSduaEQ==
X-Received: by 2002:a05:6a20:d0a1:b0:3b3:11b8:f5e5 with SMTP id adf61e73a8af0-3b4ccf81f3bmr28649142637.31.1781081421878;
        Wed, 10 Jun 2026 01:50:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:d0a1:b0:3b3:11b8:f5e5 with SMTP id adf61e73a8af0-3b4ccf81f3bmr28649107637.31.1781081421391;
        Wed, 10 Jun 2026 01:50:21 -0700 (PDT)
Received: from [10.216.44.111] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b26bbsm20453826a12.23.2026.06.10.01.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:50:20 -0700 (PDT)
Message-ID: <9e32d33e-048b-44db-8bb6-0cc642fb4a95@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:20:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for Glymur platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 13_tv6c59FT1wsIYfrCVFwWYhLTrq4c8
X-Proofpoint-ORIG-GUID: 13_tv6c59FT1wsIYfrCVFwWYhLTrq4c8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX66GUZTX3s1kQ
 /Bv7SZ5nchmkORDv4OYFduNO+o8KEP2LhIWytayC8lTfngrgB0XfmPFccFu9Tqhih/dI37xo7iu
 Hkl2Fl+OPQAH2bJCoKpur9+LQWr+paVQf1QeDvx+iE3E+3pfMED03IB+Yu5BSrvSZrLOXJOr6sk
 oiAwbwxBN04vHsw7OQV4BRbKLXabdolEGVYS3sN8Y2qvbYeRXgj/Tr/o5lrmJTHlqwouuQgNl3V
 11PbDKlHfOCEGYOaOvKjIAYbzw44eoP5VLA2wiYb38wYosZeyvEJCAXGTo1QACxtnF9/JHsiOGc
 nWgFAPIwduD4J+QmW7HodneOtBFdFjDkiApr3AAS6KrkeVHH6h3+UVkod51GQv9lGD2G8YCMI0U
 VIzBNsqr7HQq5NNBlttNpLU6EffsoBim2q39IcPZnS2dDKKYnFWuGo+eQlA2uURPCD0SbOfB1qx
 vX891GzzX+CKCFGmP7A==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a29254f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=9KNJVCxPm47J-4wTYIYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

The following changes since commit b672962ed4ea6f9de52bc7bf9e04e96585eb512d:

   Merge branch 'superm1/unknown-license' into 'main' (2026-06-09 
19:38:15 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-glymur

for you to fetch changes up to 71f496945eb7653ddc63630f49131319369afbed:

   qcom: Update ADSP firmware for Glymur platform (2026-06-10 14:15:56 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update ADSP firmware for Glymur platform

  WHENCE                   |   2 +-
  qcom/glymur/adsp.mbn     | Bin 17049560 -> 17053656 bytes
  qcom/glymur/adsp_dtb.mbn | Bin 225080 -> 225080 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
