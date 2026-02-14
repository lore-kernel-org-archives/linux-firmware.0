Return-Path: <SRS0=izxh=AS=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1852EF99E1
	for <linux-firmware@archiver.kernel.org>; Sat, 14 Feb 2026 05:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AAF5C19422; Sat, 14 Feb 2026 05:17:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 626B8C19421
	for <linux-firmware@kernel.org>; Sat, 14 Feb 2026 05:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 626B8C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61E2ponf775276
	for <linux-firmware@kernel.org>; Sat, 14 Feb 2026 05:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6BVyLsseyRV5n2lKoANtBV
	DbQwWoHUCTmYeuovwH4kU=; b=YEf7dncm8e/pAFYP6Riz60cOzjDBBlUZFhmNch
	shgidVm6peO4WpPm6Yq5aNhKClezw4WqhtW5xPdT/M3YE7pUcwPBrdZnd58pdjGJ
	jzEgDxAA29vNsbiAI/EFVN3KVkFi2zWHI1ToJ95k7f2r8PFrwmzlIZ4u+26+nrQH
	WzeuxEEa8IcAMzlGB1jDjUoG74I9/tPpXxPOBe/ksnt9QvNGfCaVyLPqQTUHxjy3
	MSYEwe5dv6qFPOPy4YfuBbch1s1l+gDAFgUApwqEalcGMmk04/OEQs+p15DCgU4+
	aa80qo1wYjk8IbtSQMz5mykKeJUcNg01JRiMhN0scMytFskQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagmy07m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 14 Feb 2026 05:17:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35842aa350fso1873340a91.0
        for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 21:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771046270; x=1771651070; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BVyLsseyRV5n2lKoANtBVDbQwWoHUCTmYeuovwH4kU=;
        b=TJIHmClndAjXz/UceoCbuiBiHnBALYDyR7EwfXa523kKW0y0XqhNWZaXVQniBV1VzI
         sUL+FP66ofVyJK4LoCDeT6PaOaXzMaVY4aqTl5svhdOHzXijyBRBN1zmlVW2avt3PbgQ
         s+2JkrwOhWTKCrHmg2Hbu9e44a5T6Fv9EA6PUPXatq5Tb/d9UUzZDoR6y2n9FYH9YS/a
         yc+Du8APuFmyr7c+2rVsSS5hhk5nYVI1sBQBuXjBgLIF7hf4IzJ+EZmjKtHnLhWO6I3D
         eAgwVY6kqrxV9O8vFfMQGIn+k5H2CetXLkrnEyoXsqbgeqdTIYF4g20Wxrm8jIUFZ9Cg
         ViGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771046270; x=1771651070;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BVyLsseyRV5n2lKoANtBVDbQwWoHUCTmYeuovwH4kU=;
        b=Do2iBABXtMfpZXTmYmhUDJIHD4P/0TIoMgN7Nz6MkEluRFNlb9HlUL3zZ2tDlsSdoe
         3OSL29pPACdzA1It/Px63Ljsy81ROoWdjB+hLplJPTqWcsqZNxtm1GH8RWIqUaDMUHQr
         v0xWUyoLyaFze575ZbbJ6dTvsLstGHOIIT7O2lGzJlzCKhgd8VRfzmCbV3kfzx8X5RjC
         VprYD08Wy7HWzo3XvDKcEEReyjcwMSLlu9+OP4YQt7yuDEwan5mHrJvEhhGjXOM/+83k
         7YjCca8rH4bqi891FHUNIvJzurNhc1k4pLrcEbUyadIbEHUVVaUy9J/NkkWOgKedBs2Y
         NJZg==
X-Gm-Message-State: AOJu0YxxYA0v5JB+mdloF4NjazUS4kTmIX0AOtOCjXhfUQUcbDQlYnWT
	CmeL+NxmcJeXHPVOgJ9/vr8pOany011nLMSPBbLtd6Iween74fIq1z0WXqMoENNV2AsJ7VRxFhU
	IF6W57oJ/M7B0eFzhleAPpTXaadcN8xjchSpDvewp3Yq1ohnfH3LMw/sJRghB+QfYzUj8qcI=
X-Gm-Gg: AZuq6aJKghTHeDf+obOXl6cyw2LI48OOsvGDO7j/Idmhzfs0GvWoQaFAZ5elf2KanWD
	PCmfg2r5FgaixiwAMvkms91mraXmCEDx6pFd0nnESNwfyV+5TFqOOgC5ipMGaS4TM3wY513KFSq
	Cazc9gELvk4ri0WPHmExFDeUKd5tJltJRor038DynBB/6NsySlKPPg8RyfVk6dnd02Mz1APDfNj
	4VzYSAeK+qpIJrms8m864IQLM/CNF8BX4cwIRHtdEfLyDtZTMhogmnHDQRoPK1Y9ciRF36RAdcI
	qYv5skdySosCuIm0JB42r7sUZzXmFTMN6Fey3h8oHJMpN/8ynfrcgPMMTZTprcGJ8LNfnEjdKsp
	lnA76H1AxfFJ4ID7pLtXIPuw+12S5/KtMOTTKA23MET/nIo4Y8mY=
X-Received: by 2002:a17:90a:be07:b0:354:9c20:83e4 with SMTP id 98e67ed59e1d1-356a765f61bmr2917287a91.2.1771046269844;
        Fri, 13 Feb 2026 21:17:49 -0800 (PST)
X-Received: by 2002:a17:90a:be07:b0:354:9c20:83e4 with SMTP id 98e67ed59e1d1-356a765f61bmr2917274a91.2.1771046269325;
        Fri, 13 Feb 2026 21:17:49 -0800 (PST)
Received: from [10.216.46.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-356a812c259sm3014249a91.2.2026.02.13.21.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 21:17:49 -0800 (PST)
Message-ID: <9a5bb605-79ac-41d6-ac76-fe0085bbddab@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 10:47:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: psaddam@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
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
X-Proofpoint-GUID: JBW8bv8elCvLrlbQSHszbA9ejoS7P1Db
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDAzOSBTYWx0ZWRfXxwzdoDxZAN2Z
 aFH0Ekf5lkl3m5kLxoV+MtM/UlPh6/JffyNw2kQl6Tx76xrXK2gC8Q9uquU6+Ul0YzE2Z23xXZR
 KfEk1uWdOiEWzpH4ONZ+qcPSkflaQATHlcZY6gOa/vba2PNnYPjpb74OJEvZkNXxNta38i++Yo8
 iAQg3GChh3hNFpJVnhFoBmjqQX76Cbd/yqD6HExUI8CPbXrx4q/P7H5qMD7Sf4Yh4omwWBgqiA5
 0pk8Oj0NIBWjK/MUrbXAr80gmHQpJNr3h17vTz3AFUaKaIUzgSwxH8vy1HmGm1peJJMBXXz6+qp
 5UoSbX9MDRhmWD/SfNE0uPl1QXe4+nYM1N1/KHCWD/dwQ9nY+gE7r3A2cQC615KcOMGogFrzzxA
 h4hBPxRQFbrHjYOdlWGGAHgj0HxyO+ftFaRderpAJy0yrYoX86MbAf4ZxsyWr8fAsbmP9lY+hDF
 Eh78MzH8kubtRhqINFA==
X-Authority-Analysis: v=2.4 cv=f5xFxeyM c=1 sm=1 tr=0 ts=6990057e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=Q5xJVPaRWf4SaYMYzesA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: JBW8bv8elCvLrlbQSHszbA9ejoS7P1Db
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602140039

The following changes since commit 5a21317b174f97c0fd62a5ccf1895ba47214f267:

   Merge branch 'robot/pr-0-1771002528' into 'main' (2026-02-13 17:16:46 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-monaco

for you to fetch changes up to 6a24a5a92c324f9aa1e8c267a2716fb71af309cb:

   qcom: Update DSP firmware for qcs8300 platform (2026-02-14 10:42:34 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for qcs8300 platform

  WHENCE                  |   6 +++---
  qcom/qcs8300/adsp.mbn   | Bin 6791168 -> 6799360 bytes
  qcom/qcs8300/cdsp0.mbn  | Bin 3170304 -> 3174400 bytes
  qcom/qcs8300/gpdsp0.mbn | Bin 5984256 -> 5992448 bytes
  4 files changed, 3 insertions(+), 3 deletions(-)
