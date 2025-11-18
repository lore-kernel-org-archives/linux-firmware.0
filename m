Return-Path: <SRS0=041a=52=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EE5CCD19A
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 04:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FC08C19421; Tue, 18 Nov 2025 04:08:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83BCEC19422
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 04:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83BCEC19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1MPlf375295
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 04:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aYI6w0gSGMtgKfxIwglZ7V
	AUjZkrfSonrNegOROdvD0=; b=aq1bM4SL0saVccEO/72eg8OhnjP9Ta3t5pbSI1
	+kd9QjEBA82QLPRrVeMnGwGv9J/UDEnuuaYROdNBNJ5s+4R/LVhlm2Rla8T3RdZ2
	lyO5fZnST56dC9uQns9cltm8bPPsCyeLLaOIsSKFLXIfDFkPx//7qBBnJKg46CzB
	/oQGGroWdcXUMLoF8ErSYZht5w7NC4vqJjW8y2pbQgsAsATjTVSu4hV7Gcnj5MS7
	m0laSQNP8yIHOYY1qHydUxsK65ailFJuJ6pmt+oFFOhfmJ1AealxkCHZeL6DHOVL
	Q31O0AjbdXw/4KD3Z2dIl36ajh4qsv6aovMnKlNRYd4E2aLw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag599a3qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 04:08:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b96038aa68so5446676b3a.0
        for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 20:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763438922; x=1764043722; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYI6w0gSGMtgKfxIwglZ7VAUjZkrfSonrNegOROdvD0=;
        b=JCUDUP1zjxCXOmYL3p4qCRtu1s9nibSGdcGZpH2O1zJ1Vlkpg10Z7ijHMMRPc9sNck
         U0PdmAzThA+VjMGtmyH8XjYOKv28dplsxlD8hKAVQuL+fniG2HDvf9WITYsofIuEAJoV
         vxN+i4hOAYy1yc2vqZsoD7GqVkrg/Nf2KcjnLekMQj0UzADYaAC9one54pnyhcTi2NVY
         TeEeJRt04bZuwnFUsmBs3rtHjIEh+3MstK4TC1KV6OD0g07UACBg6XQd0YaLv1GcpAHl
         1U1xTRMjb26fATuKskdjY43hZJ+CGCytC70fzfiOtrQIVptvFy0aCa8nPVnUBFuZpxrf
         rwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763438922; x=1764043722;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYI6w0gSGMtgKfxIwglZ7VAUjZkrfSonrNegOROdvD0=;
        b=jmUs4I7hb1pRizv/aRMmGl5AYl+eq97ZX5+M5PQqOoJ0nOd4GhwxnPuDQAjZQuTPtb
         mmZu2IAUWfFOMMuA03QtGeDbc0fNEBPG+RJiM3yaHGKuUEF5eAHupeliWvCj/pBSE6Gw
         olReW2mL3+hHolj3pqs0nU25ppqQU5WIVT0/zhLfGKP3ipF4ZDa63WdDgVEP44Ea6PSZ
         6+5Js+cLG2Csw/j8uooMmgHWQ0TdZDPEpBJ561u6IyCSQmkG6eepLPkDQPv459l2kq5E
         ROODFRBPO5Q3WVWoXSa4fscpImHDj/J5gnHuwBkdSaS+p0LpyPgXjuRQVv5TvKp+t6Am
         Os0w==
X-Gm-Message-State: AOJu0YwuUtGhs2MLZop0jjdrp+P26f8FykH4uHjqFNcm85Ydlf5bqJLD
	BE5OCWDuBz4A+Ji7BeKj56xb4DKXd+gwHzgqhPYDV6Bu2QVi3zT4E5Une2dEMb8GlE+OwTWOfgD
	U6npbCYtYA2yL1UxIX+oj9svGa7Hgtbd9932dKmuLZ64maIZ1LCeHZJMydrSrB6ijjcR7vNQ=
X-Gm-Gg: ASbGncvUpNuo+ypRDc+k4BsvhmuVf/IFti4aGrQvkYCIqRs9BuhV+4fL+X3upIdfBuW
	Nrk9GWrOAjePGb2X8KdueHtxWT/rDcu17nLvVDdqmTLWfK2Wc4D2UMOVeAEm6/ZVIgcgKxki5Oo
	5Yh8wwnZ+3PdgaavUuZHY+NQsnNHMoGN9K+3jKa/FvfNK4c5qpamcuiw+5ruXn0anmdBc7szAug
	LVacfdpIMA+x1eGA9MfoFJ2OsDcEtfek2MJawRG/jMArV8fEoTs9+OSdRAkoZHUUHwTHIIc1XFl
	JMqAqhWl7B1cqNSn/cxZOSxZO1Kny8eqkDouOGOT+bdyikmWFrdHqvxDk7AI/KYqurQIk/bMJ9O
	aNqBTy5/4280Y2OXfpgt03g6EdHuF
X-Received: by 2002:a05:6a00:3e05:b0:781:1110:f175 with SMTP id d2e1a72fcca58-7c130fe351amr2138588b3a.14.1763438922106;
        Mon, 17 Nov 2025 20:08:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyVt1yRumEgxiszuBpHu7NshY1fGh51HPoSpTHu6zWiUCZdcTzH2/bejCGpvIfsixWPS2+ZQ==
X-Received: by 2002:a05:6a00:3e05:b0:781:1110:f175 with SMTP id d2e1a72fcca58-7c130fe351amr2138557b3a.14.1763438921643;
        Mon, 17 Nov 2025 20:08:41 -0800 (PST)
Received: from [10.204.86.168] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714df0esm14888304b3a.37.2025.11.17.20.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 20:08:41 -0800 (PST)
Message-ID: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 09:38:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for Kaanapali platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L1iocM8VTy9KVA2dshuANf9_oL8AkzmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAyOCBTYWx0ZWRfX7+kURmJ+nEHm
 SYE/cBUxokMnhlXpMuPaGKZkfdbcGP77C1x+nEpAuRhw361UeHhnFJ4lB9b4T0fn/OFxH8UJeVm
 CvRKbWKyJmlYPEGnAURTw6/HyzMpy28VZjttkTTLdrXDG23Vkk7LiXGWpHfpleFLNaeqN2C8KEO
 lo22gQSCs+xi84Ua5L913mVtIkyz8G4ajE6Ux6vyrVVrJBJaroqbRPIMAM7o3oudTlm2p1mIMye
 YYsoc38oLzAAS3f3F+FK+vHYNLoJ/bcGaB8uKdTGnj6++MNzVb4BxMICo6YOGOUKA4ec9d4xR0t
 DXJiYupX2Otp2T4duRQW6JIhEu1gAwdYFAyX3SNn/iGkLt4+M9R6JJjk2Qs1wDl1tDQ4QUzcteI
 9MjZ/R47REthlilgL4a6zSuXUtbWCg==
X-Authority-Analysis: v=2.4 cv=HaMZjyE8 c=1 sm=1 tr=0 ts=691bf14b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=lhDd_UggUVmJqP-4LfYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: L1iocM8VTy9KVA2dshuANf9_oL8AkzmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180028

The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:

   Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-kaanapali

for you to fetch changes up to e1e4657026b4b6d9468e30d452434712f050c6a8:

   qcom: update ADSP firmware for kaanapali platform (2025-11-18 
09:34:47 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update ADSP firmware for kaanapali platform

  WHENCE                      |   2 +-
  qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
  qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
