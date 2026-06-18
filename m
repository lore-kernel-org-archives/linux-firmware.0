Return-Path: <SRS0=t2Gb=EO=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E88CD98ED
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Jun 2026 08:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 470951F00A3A; Thu, 18 Jun 2026 08:34:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781771654;
	b=mupR4oe1lPE9VUvmjhdynvOEEq7P9miUrkILPUc2OpSKUsBC7UC0g6QhJ4HAVly/5pcG
	 qnlVrf1x8sPAP3rU4hs1i/CB3MWZUjgZ1OlRWiulKNAEL70nwCe2tR9RqZWIbyicU5wMv
	 V5pmff+Z3cuHczF64iJb5QdXTQzojwmAFVGTY+U8armSS9HJj8QL4kqmlpBqTGaAStDNz
	 3YSt0WBozmhMrY0h7ZBqwdNSSp44qlvbzvYX2IwRSYIb1rqcQvIniQbVRCWSh/KzJzL4V
	 q20cUfrp5VV8P/kNoPW1Cjt6XrvWD0dtwL5alojf2nKbbca2aRSNrzgtaVxKRU9bHuQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781771654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K/dxtFMSgQ4TZVy0M/SFDQffvA0jqYfqkP5QqlcOWng=;
	b=fIaRikKEylqDg6xSO3wqdlFHcMi46+BVUJy5uSPKkQ2DzD6SEoqPg3EFM8dwNIv3ruee
	 uHHmRug3VjDnl3+KTYSp9R8pHE2XSpuTbAdrwqm6atIxuN4sRSWg7y7ARrFY72zC2Egee
	 arqJF/n5A57trcPNJ7pbCtQwJPcALwDB0wPp6CbgY89TM6DQgdEMGPWIRvHVfEHzvvnGI
	 Crf9uF8Gw3twky5NNFdN+vLt/8bYndApLBnhPANjZDNdSmYHBpeXvBK40kBM4UpAMG83j
	 LGSuMYRF/GlPfXbiDQ0j5O/lvJD2Nhma3Do5AjP9kIiFRaAlD3cvlrCwyALgQ+b10Ng==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jJFPSOD/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elagcpnu;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 000221F00A3E
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 08:34:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJFPSOD/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elagcpnu
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 000221F00A3E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FPZc1177663
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 08:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K/dxtFMSgQ4TZVy0M/SFDQ
	ffvA0jqYfqkP5QqlcOWng=; b=jJFPSOD/z8fmFU1UgNCaPlRZA6+ZAhqvCrWxWu
	1pPTCP2s+53mNJYudt+JWMlMIrqGfmsxLFzOPdzQlQ7jEZx2WbhNNVk3Xo8KLla5
	gARDp0a79MAWlTfiyd1QR2nTUjNze+rHjDBx3GvEOH5KZHPPXpFO7RHfSJX1lVNr
	clVFCqhccMTEM+3lcG/4mMs+9aAdNzOEZbR5RQl6jtUKHXGjLMboIYbIqpxW2W/M
	d3+8OSHTWfkKQvxGbAV7Q/y8jiy5MEQ34Stiqzu0CowsDZw5YpMQ7ydpbxg6mg+G
	3RsweuhF15sGHiaMi5JCTFvyr0aktknqhJDYNe/42EsyN7fQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev12kjm5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 08:34:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2b64850easo15749075ad.1
        for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 01:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781771651; x=1782376451; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/dxtFMSgQ4TZVy0M/SFDQffvA0jqYfqkP5QqlcOWng=;
        b=elagcpnugX2y9kKMgq/sZ/uhKn5YSCB3wK5d2AQQE0LMZRhXV4oW1HJsn/WeiaCDQO
         F3CU/4veOrUnhUqm1BVFGm4MO/H85oVcsj7kqHiAIw8nlZOgiiF16pwx3HMumEn49v2O
         vUGTcQFiQoYoUJ3rH0oSZp+bTK9smKDWBW2GaMdtsyhwSliuXaYcMe2qzmBK+IF/ja4n
         xQC351MXgp5sBgyWbl+YY/gzo9RVC3DZzlNBjLR4+Lm1uEP361b/kFvU8SAImU+OX+o1
         6pKs+KaApMVFOlD4+ZCiJsd5txkwFN53egUyJ44Qsg8MPIXR+AK12jOrb7a4VjDodtUu
         qNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781771651; x=1782376451;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/dxtFMSgQ4TZVy0M/SFDQffvA0jqYfqkP5QqlcOWng=;
        b=NGzs2wtFcKe5k1JFYFh3xQTTPCuqLyhDw3JKxWwvxaZnsCRj2FRy7rdPyj8fN1Mf/A
         0a1kmUykkRWlO8+clUq8OjB8NRsuLOBlIiL9IIyOAp/l7r/XTY+BtsBSFbxQEVvo0y4n
         VZNGtLtkCKLLKTsEXcRQbHkzxJKGFjqhyXzIGCBiDoB626Cse8btPyEVm9842ppyeAZ7
         bt5W9lWI67tNNQ5Y/3zz6Eelxq41WrmmpkwBncnobpD9oylS/iqitGpfX4riJmbvdYI2
         VGFmFejOhF6sRlUPNGI+sJ6x89frhak+rguYl81ztr/HTDZtUTFFowkPwYi//4b/SyUj
         b2Nw==
X-Gm-Message-State: AOJu0YxOHTccJcnG5rhPfgx+NHf8l9+rgVz/XIfF+aD/mTku/glo0aT0
	nZ4/cbcGEGMXpL4PJm6eUWU/xF3gdE/+qxSBEFw4WElKweI8SO6lOLSSVtm42hKbZfhZtSX4sTx
	yAJVvesuP6kBdOOMpMQiZiPnqtzAuXfWPfwi0s2SGW6IucKZg23KWWhUIZqa9DG4drxrSK+w=
X-Gm-Gg: AfdE7clZ5HEIKkeL1z6FtnnfHYZAEQRpwOfud0cN9a0xuW+ScRF7FxAD4QK+4fQx1Gn
	ELnXproDP0iJUe1D05bOxrmXMDHx/YT0yS3/74Af4xrhNbpnBLVamnyH3DIzpunFZN2uy/KSyZt
	dBbpciaIboRnLp6U39yXZjtImU5/Z2I2IH4qdur6pfWel/bBwSNGTcBxg3xGI2TH339GRfEkSLQ
	a+H+2HDW0MEhuDiMxW0W+yuvJxlMHGy1jRdKEXw75nTaRpteinkN54XL08LViougJ+qPSmQ00vO
	U87w2/zE4rFDDlp1GXaVXxsHxJ3fnzyHjg6bgvxa+qkHTCSql3KtYbSNDls27uBlj04kM15iNAA
	AlI9SxSJLCTI52zUD8Tf90V3YJdCBoLHUSBZ68Bc=
X-Received: by 2002:a17:903:3550:b0:2c6:9d3d:dfbd with SMTP id d9443c01a7336-2c6e484f0e0mr31063005ad.16.1781771650890;
        Thu, 18 Jun 2026 01:34:10 -0700 (PDT)
X-Received: by 2002:a17:903:3550:b0:2c6:9d3d:dfbd with SMTP id d9443c01a7336-2c6e484f0e0mr31056145ad.16.1781771638752;
        Thu, 18 Jun 2026 01:33:58 -0700 (PDT)
Received: from [10.216.5.247] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5374sm188673195ad.5.2026.06.18.01.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:33:58 -0700 (PDT)
Message-ID: <9b75e904-0b63-4478-88ec-63a9b15a4d9d@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:03:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update CDSP firmware for glymur platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 xsDNBGi/G3sBDADFuRVyKREhDod8d+uJxADC+IXOVOXP1Qigxt4a5Cx2rOhULbviJfiJWIsQ
 Rzlc4N1GfhTLpeNoqzd7/LAbnpc/jw0cq+f3EWPaIla0lIKthTCtMCkC5af3NyeqM64xHMMI
 W0SsUO1Zyeio970o6YcFCi90a6gNy4+cTLM3fx9wuaO0TBdkh/bsUmGx1RTZqby6Au0wBoyX
 FzDvHUYApShff+C7JNhmCkbMx33Wwt79ELPlCACFO0IH7ZS1gj5VfBOrNl3Pp0VVfQdcngex
 AvFdSiNccPgxdSWxRCPc1DvLKoq0o0ZLXerqnC31xtBpdu2J4hp+snIclks8+RBwBEoRIfql
 buJIFTzBY583dm3Z5kIwfBIRUa5o23kPv3QbbcsvCOjPE2qsyZy54ddIgTlclTwnJ0yMXRaA
 a595R72PdZ7Nz9u45mFJI+VvUQpjym11dqJKxgvoYSQ4NXVqX2xQ5Ap+F9l4p38dhCbbENFe
 h3VmQWcJ3razk/34iYHu0vsAEQEAAc0sVmVua2F0YSBLb3RhIDx2ZW5rYXRhLmtvdGFAb3Nz
 LnF1YWxjb21tLmNvbT7CwQ0EEwEIADcWIQQpVT+myzILz3YmKTNS2xmc7/wUdwUCaL8bfAUJ
 BaOagAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEFLbGZzv/BR38P0MAL7byTdYQ/8/X3yWSduV
 leTR24juRoG8SeKc8HNug7TBdMxLH6zkbqFSs1PsNMRdEUHey+Pp4uB9RCHsDb9IiHecfn73
 uA+CjHyRrnbVM+u3EeCHvt79QacKsZ5SMBfW2FwVRcsg1fozW+e3SM1RjWbIYtU/QVbx8gO/
 mnFTgnrZ5mHgk/DK2zYRbIUG13ZJN5NDbFhDEKbNNeW2OFuJgAnaWw9Ka2XaRC5dFluen7PN
 0E32OEiiUVSiFBT34Of2qNDGWj+GAkN5fvRa9jU4pNSYgQPt6+shaaN18OoZvZStJbe6wInh
 KByf/2tjqGLZ1Gn6T2s1QR1R6VkoyfhjVG4iYjSpdsMEJN25Wa9d7LeGWdRO5V6NpMIw5Y0D
 TMQ9dVW2c/jU+AuLJ2YcUi3D7kWHVu4s565SLaovEPxkGj2u7WQBEZCDGr7QNeITV6vjI+w2
 38SINd7HsH9LMCDnDFCelbbnyTw9yM66Q2VyKud4nGzQ3HhoD7eMkbJKYWG5As7AzQRovxt8
 AQwAvS7iU5Ee+lb9JJ+MFe0JFm8RQllN6wA5yZWoHzG4EfZ0eusLmdEZioHbSST9UBme9HoV
 wTdvKhrrp+EWIX4zAVqH3xXShSnJ7tlsTWf8D6GV4ctHEu2fRRypXJ6GpJDLjtMUYOWM/ho2
 BntduLHo5J3yg3PvgMj9nTDOcwyNKBzhycXxNQk8ExT2AU5YqR8Q2NWF4BOW+Lac/I8QM32/
 IrGqPMwTkcqv3CJMk+RCRxRSsP7ji2g19k9aqFV32jjvvKr8J/BAxLO7di0+ETCq8h3M2/td
 Xc23DCQa5W5grCNHnG3J9lj6PBvG4/WvQQGnP9lLCrEjkInq+YQY5PU0OwsTNBMeaO5Grnmr
 cgQ9GIEGxd51qyZHc2rFDcJai5Q2JpwkihfDuO1MVnaOkrD5odDyAjKr8oJqbu3hFvqUUtTb
 OtM3tODZ+cAJPJ8WkG2DkT6YFKw/6SSEdsg5XOmKA8i7OA6fVwHg7jiHlzXB2kzxqS20JShl
 Y9WJAc8YIcG9ABEBAAHCwPwEGAEIACYWIQQpVT+myzILz3YmKTNS2xmc7/wUdwUCaL8bfAUJ
 BaOagAIbDAAKCRBS2xmc7/wUd3ayDACEHZxA4o7NVyv9z7pdxzSFZ34Tv//HBfyzZPx6b5vV
 OI3PEFT9jSBqwwWVwwLdRoE6vw3dNAuHUa5IoiXkIo7CRtvddLPryPyHwq4+I8uRfn8jNNgD
 4+5weUZvMtGZlxjtV4jXEdRwZuFrlY/p3nyvGFBjkes7pEBExjDuW4ligyYKF7pM+Ndrkw5n
 q7lTD5c8evUv4q2Fs9KCxyaKwAOb1z2s8tO3EeOmGWmhLWgtS4o/rv4hDNfyCji6BjNGFpt1
 5yiRSqo4FJuz+Lr6GEO1sod/MHZF97iUOHDoaOIoeKwX246DwtXL0LQuYqNrq7ryPunmTpOE
 qaXWztaQtxsBJdBKUeEO6/ukSPYTZiTyXZi4M309uDiX5EDXIiimX7Vfzf6qWYln3jtpca7+
 wjt8XHC+OAMMkCkL62+osvHOhazJAS2xCR71LEn81bXxEIs72zc1R7U6Gk2P9K8t3NbaLNBU
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3OCBTYWx0ZWRfX9mzx3wrFx4kW
 naqHN7VIVgsBnEyxNxC/CqUj4KY/meZvuwf+31VQyolUGB+Nu3d6MIbiMCJmMqucQKKWCizWYRD
 dRDuyjITNcos/D5rCdvz3EHq/dkkgR1thazcYC7jd5boseieDFfIW9XyNFYDLB6eLs5ypn4KBLJ
 gLy0U73/Y6FpEMY5cjm9UymPOYZaGYdqUjjLB57m0sbe3DQ8bbRAQaSq3ZF4k1KhRfK75A7+Vhz
 yUFOWp1aOIS+a0S3/L7t+YxrG+jZIgogh9WJLiaMwsSfXGi/uBFLFZwUoIeXPmGKRrs7BKctW4I
 XrLVXieENqX+TxR2Pv1AfXTJmvKQ34MO8GzYfwVlz75tytLwBnoeuFEf8r10ZfaTo8Kk6iW2Sxg
 BBhTJyrZxrLubWRo6B9nsAjNSQ3u3MVGIXsZ+o5ICdIk6yNSTx0PeB2G2QtVs0+N1Six3wgSzx7
 CfjjfC4QKCmXlM96gGQ==
X-Proofpoint-GUID: Bcyr3VQMDcvplSHNj1pfmJ1vYJhbjyfI
X-Authority-Analysis: v=2.4 cv=HpVG3UTS c=1 sm=1 tr=0 ts=6a33ad83 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=hMXMwYmzv-2CvN4CDtIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Bcyr3VQMDcvplSHNj1pfmJ1vYJhbjyfI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3OCBTYWx0ZWRfX1KjBq0iX8Tlz
 RZTbsIqMHo3SXcLCoSir79H1fT8tKOeDHG+cIpKpFN5JifrINOIqvfjljxHaYUFGXGBlwSo4/lm
 AogXbFABFExPzrsbuH+zxZM4ULQ3oy4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180078

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:

   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-glymur

for you to fetch changes up to a8535603b87aa5e79953052834e7fd0795cacf90:

   qcom: update CDSP firmware for glymur platform (2026-06-18 14:01:41 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update CDSP firmware for glymur platform

  WHENCE                   |   2 +-
  qcom/glymur/cdsp.mbn     | Bin 3252504 -> 3252504 bytes
  qcom/glymur/cdsp_dtb.mbn | Bin 69432 -> 69432 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
