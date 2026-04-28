Return-Path: <SRS0=5P+6=C3=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B044FF886C
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Apr 2026 08:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FA47C2BCB5; Tue, 28 Apr 2026 08:49:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5128AC2BCAF
	for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 08:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5128AC2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S6pcaG1625529
	for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 08:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ObXY3x1bDNivicq7DYgcZH
	P3TscrYpdNjRy9Vr2MLTQ=; b=lsZiQ1rxkincKK4eCq3A6X/0cj6ueVK2uGHH4P
	0OENshABP4elR7bpv503nFn15iNYwNSvEjUT+OzjfORzurObGzEz3Ge6eyei1VSm
	SIyEft5FSBjoLCeUyoXcDZdlGeaA1ILnUpsPARDf80lKEUt1qJDu7lQ2U3tlvY1j
	thGTIoV8ck7NhxFGYkf7fru4whP4eDUDY1foEAvKcqKdUTzSvS5pUTlEnda3h/Dr
	n55iuIADwbi+lSK6V+Q9gLcfLv6nJ9a7TqYOfOxMbJXeWClPZSa41inCoGjmvm3G
	0zvTvOe7jwXDbBFEQZAgCZQO4OwbPPwrLo6sgCD/PnDLEz1Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsa2pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 08:49:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c795fa31e18so5760947a12.2
        for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777366168; x=1777970968; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObXY3x1bDNivicq7DYgcZHP3TscrYpdNjRy9Vr2MLTQ=;
        b=GMiiFP/+1k5jWtm9vm1oAdadQlOzUNQux1hisrRal/l29y38M3ktkBJtPTTjOFo2XU
         5ek55nxuhb0UMjWg0wlSkIbzVM6XqKqQXqc0GIaw8iQn5oT6Gr+LMt5idrvdunbuGlVG
         MqIKcwMqOqlg8croqag9quEzWTmMH3hpsjniJPk9KuPBgVTKIzOMm9mmt3A8wyslTdrS
         pjyywAzKCDLjkrExdqJ1JbPVjnaz4haJyEixueMh4MhTGohg+woM8yBAaHTcB/aylvnT
         EEoRIxtG3vnBe+/SOi8ocKo6TEw0dX04zjt5oq4jBPK5TMHoBxRPGkM1Utmy+szRuEiE
         0Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777366168; x=1777970968;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObXY3x1bDNivicq7DYgcZHP3TscrYpdNjRy9Vr2MLTQ=;
        b=np8O6prPj0sVGhDoCUO+622W0XenJzX80hsQUsD637dVinFjmbDDLTcRhWeiaCo5HV
         SoKqrO6dlO8iZs6jCcn887Myl5GjBpH33JhozTfSunuoR3bHj3EIaiInrv4Ewh/lyrH/
         B5Ql/v77Ixzy/0yClY8RRDAU0p232Cy5tEY7csPbP8+xccT3YYunbHpGzhsSU0P7oncE
         vELv/3KSUigR+WYvQ6i68nsfyP2AleISLdK8GHjNZ8p2JG6nNA9s7vrwQDTmX/fnH5W0
         Cj+1AIQkRLeiQZ0mUZzwD3rhnZsttrI9ejRQIzJ5bqENdx+Q8k4D6sZV2a96bF/eEoD+
         VOHw==
X-Gm-Message-State: AOJu0Yxx9NMU4DgKhSBpWZp1AFZPIzf/M6iwOOBGtZIVu6FXBsNafdeC
	yUtaMNr4wq8f9p3H8V8fBxUrW0H5oxBKSt2CpdRSS4imJPcRNE0MP5EzDz0P3+3G+YZRjtOZYoM
	FVgn5FUMSqlGUHW1rAnL1QB/9axbPZ1gWHgbQpjjrYOz1vZygBUG5Edvq8KQpisGbmNTliXY=
X-Gm-Gg: AeBDievkLyZR+G/xgFNV/jqoa9wngBsjLVbs4hVeTT8iJ6TBvDq3hpxygWEGxx65SMV
	X+zRnHyujbeMNPdvb+XfADJnN3mk3L4+uakrb2zlQgmZQ6d07/g9NojWfghUOT8DPokI7f+ti1R
	HLHr6akDFhBMCOoMQXjlxFMYJFRzuM5Abn11G209seiNGDJ+XBKDccQas80r0kfUwT+ccaG6ZX3
	VaXsl06PJBLI3JpgsFqMyu7NhcGC2Eg30iDAEh2FbxQoUpWhSTSJ7wYjzwuhMQfxmr8K8E0XhDf
	Qd6UnQ1edM3qZro1jFIeRp537wmLMMA3VsmWgXcp0zJzWXuCvHC5HFREKybvszkjV1/PoDap4Ac
	M5ms2kk1HelMpTrrU9Aq3Ts2ac2cIKaD2E7Pr1Vl35tVtFcwhag==
X-Received: by 2002:a05:6a21:e098:b0:398:71f2:59b7 with SMTP id adf61e73a8af0-3a39c27203cmr2834150637.33.1777366167529;
        Tue, 28 Apr 2026 01:49:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:e098:b0:398:71f2:59b7 with SMTP id adf61e73a8af0-3a39c27203cmr2834123637.33.1777366167071;
        Tue, 28 Apr 2026 01:49:27 -0700 (PDT)
Received: from [10.216.36.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc35daa66sm2121446a12.32.2026.04.28.01.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 01:49:26 -0700 (PDT)
Message-ID: <bdad5aeb-54b4-41c2-953c-015a826dbbe8@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:19:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: psaddam@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update CDSP firmware for Kaanapali platform
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
X-Proofpoint-GUID: onCbV4Qo0WoyYaaCAkoqUrH55ahCxkDv
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f07498 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=8jgKNhayWl3y9IlJ8EoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MCBTYWx0ZWRfXy3URa7WG+XFy
 S423XzyiXw4x4sai+Fglk9iwDXwFkoWDNt+z7W9B7TJqfsFK/NY3hSMgBtOVKMb1dl+cavbOlcD
 svDJ2+h8MlRtu99uNyoSlSTrk9gLWohxqsJC+E+x8mm/+o6GEfnp0hYoFcg9q5v+ZFP9pmCcpjM
 /20IsPHv8qnxiMZ+ZiayWh7LcDmK0gPwPVBt7mWAOEErbUOFQjBS0Qn4bYWNRK5G0x6hZbODChU
 b5sS+Y+c7gGdLC0H+qf3x2dSZxPKnZfSQMXv+VFzl5PrmlaB4j/J1BuZX5RipRWK2w7gURBFFlB
 87eGcIS0o+wJGxxv6fzYWpkIlvY2O2vyPv4cGGkQgD0saO7HAwui+CVOhzctnwU6WhyZhwH8wgL
 QUwHtfQKgyrULFmeSbxxnOy3+mY2uRaOUOm8wyWmax/vAjcKWWL9U0xnwypS1ptk+leIa/6uN8f
 q6N6TBuhAEyQqljk3iQ==
X-Proofpoint-ORIG-GUID: onCbV4Qo0WoyYaaCAkoqUrH55ahCxkDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280080

The following changes since commit 40a3a8bc43b7f19bb22481947080bbdca304b4d1:

   Merge branch 'robot/pr-0-1777357217' into 'main' (2026-04-28 07:31:56 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
cdspfw-qli-kaanapali

for you to fetch changes up to 0cbdd055b0890a7c928a1e02c615a650df38dc5f:

   qcom: Update CDSP firmware for Kaanapali platform (2026-04-28 
14:10:31 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update CDSP firmware for Kaanapali platform

  WHENCE                      |   2 +-
  qcom/kaanapali/cdsp.mbn     | Bin 4960728 -> 4968920 bytes
  qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
