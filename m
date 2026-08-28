Return-Path: <SRS0=G6tZ=GV=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA14C61DB9
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Aug 2026 07:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFEAC1F00A3A; Fri, 28 Aug 2026 07:56:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787903779;
	b=e/8K34iZ5YNPOZlImYudSBMY93kIcHq/FwJuU4UoF/ybLx7ehqJx04jWyfDFiwXDme8L
	 r2vuI8spC1J51gxcHz7VLfC5swGNfdUlIwsbVVARf8hTzXp3QlHEEPfJPlfRf849kfW21
	 P11wV+H9+228u4zbE0/dhipiyZMgGPiXse7kw5KwZCg6Yi3xZn54etKD0pc3L6dvEzptZ
	 F47hPe+lIoEjGTtTFcQ4AX7yiEG7MEHwehN+E/49G1/CDssPIzzea3CP8dvxy/qPxNsui
	 a21oRLmWlOVc4DwbSw/mJk5PYZBu/jCgaqJthNFAW1fgGJcbKoOsrmEEdY6W01cz8xQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787903779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n06nL3Bg+MuYNWeN3KwVfkcqwpiHtVR7wh2DvIzOFkw=;
	b=gDX0Mz179EsClFwUzKa8/gAIUuAi7lmFTb1V0JPlTXrUD74TIicEQR8EVjaUZqrwyuz6
	 l2pL06mVfDuIkaZ8bW2fV70dlLaFvuppZiF2n6AhsNuasFNqQnyCbhX6ENipHPbhIFN8o
	 0i6NiYwdhKKjk2hg3MgC96xaz00I8XMm8cWchPxr5EVUJSIiO1c5NtUvmqKQv1hhKXvBa
	 Qf1bkhPWqjL0h/TXxKjbVfs9U05f1rvG8JGKp9Ala+N31EW73yr9J6Qfdj3p/6NrX3dzd
	 ZAosAE5+fwoW0VBBHrPkmsRiMRrU4El6zE94vgFe/D86O/y6T91Z1pVO2RVGc+l2dwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hDU24jIZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNtI+i0W;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECA771F000E9
	for <linux-firmware@kernel.org>; Fri, 28 Aug 2026 07:56:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hDU24jIZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNtI+i0W
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org ECA771F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66d0f1605913
	for <linux-firmware@kernel.org>; Fri, 28 Aug 2026 07:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n06nL3Bg+MuYNWeN3KwVfk
	cqwpiHtVR7wh2DvIzOFkw=; b=hDU24jIZaw2hT8GMy+biArCy91A55T26pzJY7h
	IWWQobL8ivQ+jWgnj6BSgXS/2hFyI6xwXlUM2Sq+I2cN5+8JlF3n35EZa18sHuMi
	Sktvvgpe4zIanUTglzgi+Whq4me/55INl63OdOt7yr3YykB/a7UKcrZrbZ53syBg
	QzE4Avu+VDxGBLgrteeYCQRlVi4laOoPYvEr+FTgL6VTBy7sGfRdV/Ogc/08M//j
	Fcj6RSdCBuTMOzBxHsRK7A675LCd3qFTjMYgdQlA836YxTM4HPci+bM+eNU6oa38
	Y01st6vrQyjOsSt9S49T7rpfqZ56bWP628li8E3pcxYnlRVA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r8k4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 28 Aug 2026 07:56:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c057f480so1002805a12.0
        for <linux-firmware@kernel.org>; Fri, 28 Aug 2026 00:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787903777; x=1788508577; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n06nL3Bg+MuYNWeN3KwVfkcqwpiHtVR7wh2DvIzOFkw=;
        b=QNtI+i0Wi41fWh/89Q9AWHrePoaGmBIAdccXIkQASRlFBY+Ah6T+uHt8dxeGRXwt34
         hbEOUqEEg8ZzGo2FggMHKHnjfTyPq2Q16t8JLDM1Tpitz7ozlLzi+11xTuipKYXHgONt
         5A2fpzbpOUlfW0mDkxeDEurjahyTVf3YdCIdYDmdWdMlmZBFzHzNdoZowOqA242Wu1O7
         5eNQZ979iLV6pwx42xbgVZrXxgbdH0iDybE1cPrX9lKtZoYRSMR4c26itjIJO7xpzQJq
         PKZJviWvQCUbNsFITEdijN5Lp4c11P1AZFVTzbf+sO20/ZNpHgmczGd+/6SZzPpw9Kju
         eAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787903777; x=1788508577;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n06nL3Bg+MuYNWeN3KwVfkcqwpiHtVR7wh2DvIzOFkw=;
        b=KZ36dVbwc4k3K3M3h/rwydBZHcnu3FFX0k57iFq8k9sF/nLFdbXAwUHdz6StvCC7z5
         fEtZE/ZGbyUMQIyNgqhqIIDQ6qHnmyP/lvBA/Bc9fKke0PECuSY/5PtWU2f7HjcwrtaK
         mihSxVCs30EUsibU1PX9PM9ytOwIulsWKQJ6yjuZv9c7sx8h4vjPKt2oJkhYx5q+tVur
         zx3jOmgXox4vkuvEJmsz74Nd9oAUAvx9D+hBP64kZZL7d8ylNwYlHG/J8hHoKW1o8wm6
         6pLEPu71lSOEQCnqojcDLJA+ZO5NCpT0QsS6fJCuZIBYUwM+et6u5BGYBsmPlYsBuXWt
         OKBw==
X-Gm-Message-State: AFuF++mIMy/W6HfKLhMBnpbhtSaf47mEobAnYo8q/YImoaB73f6svKhC
	uyGMbLlhmu2MlRzWwQ1Yw9H03tqfD1nhaGL/xs3z7h0ZJ+hPLzDg00Ql0jFHBJEG2Fs9/Ef7mFE
	6kFUuBP4yuqXvi8r4lO8eJX/B1GkCfCTsTk78sBMot/KBHaVsNzldL8L/Jcrypvp7POjU3tg=
X-Gm-Gg: AR+sD13dZJiXiD8sr8bvRleBjexIXaGaI155R85yHSOGwEugIS2PtYxh/HD7Szvre14
	mGF2133jC0bOv2YVRacKhkS5mzu9JzjOBkX2so+VUPZWyHXNJ/RIJA9tsiZOGgl5tWLCpFswLOh
	BSOpX1pJP6HC6NE3SmAGFrLWrKBBLCEgZYG1YWmUpJQwhHzTmNSxQ4iaZeoi2UhtIYmneyvNlEq
	Nl2fJOh64GNdhUTBXSuwvi74sR3yXMmB+zEErRQJySFvLVlp9xZ7UwNYs51eQO5AU0PhLxMsYfE
	bAYAiZyXFDVIEWZoRoCREh9Lg9IbYrA2ZvhvUpDyXT4f80Vd15jhmu7bQhcUhllhc6Qdw1MRuOH
	G0oAFizI7nBg//WZjpnaT14vOtQsSBw==
X-Received: by 2002:a05:6a21:496:b0:3d1:c0e2:936b with SMTP id adf61e73a8af0-3d26765e5f3mr12004907637.7.1787903776783;
        Fri, 28 Aug 2026 00:56:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:496:b0:3d1:c0e2:936b with SMTP id adf61e73a8af0-3d26765e5f3mr12004837637.7.1787903776351;
        Fri, 28 Aug 2026 00:56:16 -0700 (PDT)
Received: from [10.219.56.152] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm2929725eec.23.2026.08.28.00.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 00:56:15 -0700 (PDT)
Message-ID: <65fce20a-3cf6-44c3-9b43-2b7ed8112bfa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:26:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update CDSP firmware for x1e80100 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S6rCjT_hI_BUqXtQuStFT-PoiOBUs_QQ
X-Proofpoint-ORIG-GUID: S6rCjT_hI_BUqXtQuStFT-PoiOBUs_QQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA2NiBTYWx0ZWRfXzgdQqxav1NHD
 5ZCHcjhO+Q6ebiCSuPcCDSZXOMwR2tNroTyeOmaZhV/g2tSbq7HX8eKuas7Z04BXEQvIQNRcmzi
 EkXkiZTSohCLn0vZaX/jAdPzG05OPUQg83WJKAsOIAL8tzVWBD5goY4g02Rrbvq7e3sBYFCrhtG
 dOx3oln8Qp+6WTBlN2G/K7jsmQlDirSK+QVIHUd3riY+zgMGIvsbax4ebOHbbho0fD/yMW3JivX
 rrjOBnvIcQMUZGdPpounw2mLRawZ26HUTmGEOgSqRmAjCyOAqH7F5q0WKfBYoYogcLMzrExxM6r
 YouYBzrus4w53bPFZnv8N+dTjeuMIeXZ1rAe++KnUu/21efi0/Dlb4JPyj0mlyZhTrAVXA//x2j
 emYUCHs6ZdLQ6AlaXOOedwdC3ZgGVvgBX40tY2xOvnAHTzJ9X7DxAcIyGtVtZ6+aEW9Mi8VHhmB
 uslV4f1XwJzATWj8KmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA2NiBTYWx0ZWRfX7+OD58C9jDQz
 m0daLNQFrU1njV21Yt6YOvuKukza6f7B4J1jO8TCHNfJiovLGsiVl8624uti/1JFNF+YSsnXNnE
 zNIbzlidx7HbFiF0iU16C+bhl5eEKyw=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a913f21 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=VnrgLx6FQCjrsF73SvYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280066

The following changes since commit 89aa3ccb5b67be68c4b15241d8ca666014288afb:

   Merge branch 'qupv3-fw-nord' into 'main' (2026-08-27 22:42:34 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-hamoacdsp94

for you to fetch changes up to db9b63a5baeddf32fa1635507383adeae997fbc3:

   qcom: update CDSP firmware for x1e80100 platform (2026-08-28 13:18:10 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update CDSP firmware for x1e80100 platform

  WHENCE                     |   2 +-
  qcom/x1e80100/cdsp.mbn     | Bin 3215784 -> 3211688 bytes
  qcom/x1e80100/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
