[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

$textbox1 = New-Object 'System.Windows.Forms.TextBox'
$textbox3 = New-Object 'System.Windows.Forms.TextBox'
$textbox2 = New-Object 'System.Windows.Forms.TextBox'
$Button = New-Object 'System.Windows.Forms.Button'
$dataGridView = New-Object 'System.Windows.Forms.DataGridView'
$label2 = New-Object 'system.Windows.Forms.Label'
$label3 = New-Object 'system.Windows.Forms.Label'
$Groupbox1 = New-Object 'system.Windows.Forms.Groupbox'
$comboBox2 = New-Object 'system.Windows.Forms.ComboBox'
$comboBox3 = New-Object 'system.Windows.Forms.ComboBox'
$Button1 = New-Object 'System.Windows.Forms.Button'
$Button2 = New-Object 'System.Windows.Forms.Button'
$Button3 = New-Object 'System.Windows.Forms.Button'
$textbox11 = New-Object 'System.Windows.Forms.TextBox'
$textbox12 = New-Object 'System.Windows.Forms.TextBox'
$textbox13 = New-Object 'System.Windows.Forms.TextBox'
$textbox14 = New-Object 'System.Windows.Forms.TextBox'
$textbox15= New-Object 'System.Windows.Forms.TextBox'

$Form = New-Object System.Windows.Forms.Form 




$Form.Size = New-Object System.Drawing.Size(1100,750)  
$Form.StartPosition = "CenterScreen" 
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Sizable
$Form.MaximizeBox = $false
$Form.Text = "CONVERTIDOR DE AUDIO" 
# This base64 string holds the bytes that make up the orange 'G' icon (just an example for a 32x32 pixel image)
#$iconBase64      = 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAAB50lEQVRIS7WWzytEURTHZ2FhaWFhYWFhYWFhaWFh6c+wsGCapJBJU0hRSrOgLBVSmkQoSpqyUJISapIFJU0i1KQp1PG9826vO9+Z97Pr22dz3pxzv/PO/fUSkvxfOLYOx9bh2DocBzPZKlPtku2VuS7JtMlwIydUw7EnGO50Rd4ehPRdlru87GWUMZVU4LgOqLza0cP56PdHNga4NthgsUc+i3qIQOH9qDzAYLZTyiVd7Ah/8/lGztclNyLbY5JfksKxeuiKRvAzwOy93OsyR+9Pam6HajLHm5UfXhTQT34GqDH1eCGjTZxjkmqQmQ5+6Gdgth5NQLsoIRwca7AoTZ1k1UM0p7Y/QXCsof4sdOvRrRlgeZgyu49eY/0cTDO76ShzcJnTQ0O0NvA2XioWqjIrcKy5PdQ1kLl90CKsVC9F2GiYVVPuiQaDiRb1TzGWw9eHzoEiGGwO6hpHWFRe04vuu4pggCPIFPwowSWmAXa/qdKr5zaOaQBwyps6W+UEh/gGtasFlrjCKC2+ATia15WucHpf76vna/2ylVLntnmeRzbApsUQ4RXZwAFnAC7eMMLNSrWhDEC6RfUac1D3+sRew87HhVzvC4PjYLBecRxhDsByn/qEoYRqOLYOx9bh2DocWyaZ+APgBBKhVfsHwAAAAABJRU5ErkJggg=='
$iconBase64      = 'AAABAAEAAAAAAAEAIACCLAAAFgAAAIlQTkcNChoKAAAADUlIRFIAAAEAAAABAAgGAAAAXHKoZgAALElJREFUeNrtnXm8pFV5oJ/3fLXdfV96vb1Ad7OD7CAgNCpCUMHgoKMZ40THSeKMWYzJzCRjMplMTOIkJjGOMaMGFTUuIIMEFVAEZWloaLqhu2kael/uvtet5Tvv/FG3G6Sr6t7uW3epuu/Dr5s/qrrurXPO+3xnfY9gLCi6OppBFFUH3iMuUqfoWaBXABcCpwPLgXqgGhArtUVDCCSBQWAv8CLwJPA4IrtEGVMBFUFU2Xekd8oPtMazQFjZ0QoqIJ5QowRkliO8DbgRuBRoBaJWUsbrmAB6gCeA7yLygIS+R52w7yisWgp7DvWZABYyXR0tKAAK4lpQvR34VeA8IGIlZJyEDDYBXwDuVmVERFGE/UfzSyCwMptfVna0ANDmQpLqrgH+GviP5Lr5zkrIOAkiQBdwA7BehF3igqN4paGmmqGxpAlgIQY/qvFx3Icmg/8NVi/GDIkCZwNXo3pUQ3bi0MY8ErCGNl/B354LfoUaEfk48EmgzUrGKCFtwLXiGFL1W8SJb6z9RQmYAOaBro7WY7MvCRH+APh9cjP600eP/2UsJuSkp+1qgDeKSH8g8oyCNrxGAjYJOMesaG/GiRBzEZfy2Y8Cfzat4FdAFVVFAodEI4hzuRo0DyyCwM/Vs3qPpjOoV0QE3LRDuEeEj3jhuy4UPI793d02wzzXeA0JXIyUz17PdJ/83iPxOPHlHVRtWE1sRSeRpgZcLGoKX0SoKjqRJtM3SGrPQZI795A50oNmsuCmnC9uU+VPRHlJxT/XWNPL/m5rPnPKys5WUAVlKcI3gTdOUeNINEL1OetofPMV1Jy3nqCxPhf49thf1PhUmkzvIGObtjH4o5+T3LUXvJ/OEOHrgnwYGFUxAcwpXZ2tRAKRTNb/F+BPKLbM55VIayMt73ozjW++gqCxflIeFvjGJJPd/8zRPvrv+TED3/8pfmx8KgmMAx8S9Xd6F7VJwLliRWczKHjPeuDPye3sKxj8seUddP7Ge2m8/gpcVdwC3zgRzf0J6qqpOWcd0aY6xne+giZTxSQQBVrFcS+q4yaAOaK+NkFNtoaMy3wYuI1CvS9Vou3NLPmN91J32XlWcMa0RCBBQGLtCiJ1NYxt3YWmM8Uk0AmyVWCbCWCOaKipJuMybYJ8ElhRsCLjMdre/3YarrvUCs04OZwjvmoZfixJcsfLxd4ZATKK3GdbTeeAFZ0tCILkdvmdWfCN6qm98Cwar7/8VNZ7jcWOKhKL0Pz2a6k6vSs3KViYKwVdZ8uAc1EvogShwzsuJXeMN2/ludpqmt52FUFtNZqv8pxDnJT5AoCiYdGGiQTOBDidkvQe/Osag1einS00vPlyJnbvK1bW7cDlJoA5wHnBO60md7qvQPwridO6qDpzLZpvws8rI088y8RLe0HKtOOmSqS5gYZrL8VVxfKKTNMZBn/yJJmjfSaBKcqy5vwNVJ+3/kQJALUXnU1/54OkDxwtVI4J4GITwNxRC6wt9KIgVJ99GkFdTd4Zf1XPyKObGfj+wxCU6dSN9yROX0nd5efnVjZebwARfCrNwL8+wviWndPZ3LJ48Z72D95KzQVnoD583WtKtLWJqvWrSe07ggQFRWpDgLlD6kHzH/ZRkESMRNdSxAkaFujjOwdBkOsil2UR8Or25YLvkdxW50hgAiiChpIrn0JNJREj3rUsN2QsTJeV8Jy1fV9HwYw+iotFibQ0Vvhyv3Xp55JoayMSLZpEqtEEMEcoVFHs9GXgcIm4FZRRMlwinustFn6qVJsA5ghRcRR5BAqTXTrb42+UAiW3Vbj4RGq5DibLtUZK8R7DKB02CVhOaO4wgZbrUNor6nXmnpvMi1DpiMisL4WaAMqoMSTWLKf20nPLdhVAvRJb2oZEZ9bs4l1LiS1pq2wJhJ6Jl/aRHRyeVQmYAMoF52i68Woa33Jl+U6ma+57uHh0RqcbG6+/guZ3XoeGYWXWtQh+fIKDf/UlMk9ty/UETACGxKJIPFb+X2SGT26JRXDViSm3FJd3GTEnPT0TwCILnkoJjmM5EisSmbtEj7YKYBiLGBOAYZgADMNYjNgcQDlRKcdjZzp2l8myqNTjwnP43UwAZUQ4OoZOpCnndUCJBAR1tSdzocWJ5TCWJNM7AJW6CiDgkyk0k531mjYBlEvohJ6+b97P0E82lfFGIE+8aynLPv5BgvraU+4J9H/vIYYeeKyy69sr4eDwrB+JNgGUT5MgOzhC+tBRpEwTgqj3JVm/D4dGCAdHKvd0sfLqMGeWMQGUEyK5dGBlOvYVcZP720tRDpVcz3P3o2wVwDAWMSYAwzABGIaxGLE5gLJDyzZviJbyF18MRyLmYC7ABFBO7SES4GKxss4HINHIzOcAg2BRJLPSbDZvzn8TwGIMfudofOuV1Jy7rnx3wCkEtdW46qoZ7QZsuPYSai89d6qrr8oan87Qf/eDTOzaN6NNUyaAijGAULVhNdVnrCnrr6HKjAM3cXoXDRsvg0pNCIIQjicZfuRpdNfeXMJYE4CB19KOo8u4HAh95SYEEclJcg7yHdgqgGEsYkwAhmECMAzDBGAYhgnAMAwTgGEYJgDDMEwAhmGYAAzDMAEYhmECMAzDBGAYRllS0YeBlrW14BEiojiZ9xwSxU+uSO7IrzjH4sh2ka8MBHHClJkwnIBzyEkcljn+zmP/xi5ZrUwBrGpvRlQJJ/OpR0UJPQmgFqURoRGoBokyd/lXvQrnFitvzWQZf2E32cGRxds4RfDjE4Sj40WrJrX/CKNPbTuJY8WSu1I8ESeoq8ZVVeGqE7hYBFXNlfciLfKKEcCKjmbEK14gDCIEqvWonuOVK0R4g8I6hA4gnvveOtdZNSI58eRv+OH4BEe/8K1ZvwhiwaOKptJFk2AM/vBnDP34iZNzi3PgHC4RI9rSRHzlEhLruqg+cy2xpe24RPxVGZgAyofVS1t55VBv7nkRjaA+XBJ4/0vALwMXAi3l0vD9+MTiDv7j0VrczZrO5CRxCoRA5nAPY1tfxP0wQqS5geqzT6f+qgupueAMXG11RWcaqigBrOxsxeNY0d4CaB2hv0WQXwfeAEQrreEbJSoryeXYUe/J9PQz+NDjjDy+hZrzN9D09mupOW89Eoksit5A2QpgZUdLrruYySDOnQXy34B3AFUWHcZJyUAEn5xg+OfPML59N003XEXzOzcSaWmY9aSc801ZDjhXdLagwAQOnLsR+CpwuwW/MSMROEc4OELvv9zP4b++g9TLB2Y1IacJ4BSDHyAb85LAvwf4PHC+tWCjVCJAlZHHt3Dor/+Z5PaXK1oCZTUEWNnegqJUj0VJVmdvBT4NLJnuv1db+7X4nu7cgROS21/myGe/zpKPvZ/EaSsrcjhQVgLQUBEnJKuzVwF/MZ3gV9XJwFfiiSoSiSoikcj0G4JREah6MukMyeQ46XQaEcFNteTqHMkdL3P0C99m6e98gGh7c8VJoGwE0LWkBfWAsgL4H8CUCfK99yQSCdacto4LL76EdRvOpHPJMmrr6giCwKJisQQ/kMmkGR4c5MD+vbywbSubn3qSgwf2E2azxUXgHGPPbKfvX+6n49d+GYlHK2rTUFkIYNmyOnyo4MJAfOTXgauLVrgqzjnOu+BCbrntdi694o20tLYRBIENAxYzIlzKG7n5lhSHDhzgwR/dz713fZv9+/Yg4oo1KAYfeIzqc9ZRf81FFbU8WBYCqB5uIVU9CiqXAf+OIvtEVZXq6hpuefft3P6+D9C5ZOnxYUBYsTfJGCdDEEToWr2GD/zaR7j8yqv5v5//ex79yUOEYZh/aCiCHx2n/+4HqT77NCLNjRUjgbJYBUhVDwM+BnyAIuN+VaWurp4P/+Z/5iMf/S06lyzFe29PfeME/ORuvzPOOps/+KM/5eZbfpkgEqFg/945kjteYeSxLRVVDgteACuXtAICKucCNxUL/ng8zvs/+CFue8/7iccTxyvZMIqJoKW1lV//z7/DxjffUPTB7jMZhh56gnB4tGJ2bS54AQgQJrMg3MAUs/5v2vgWfvk97yMajdpT3zgpCTQ1t/Br//GjrNtwRsEHh4gw8fJ+kjv3VMwq0oIXgHolqIo0AhsLvkc9HZ1Lec+v/Cp1dQ2nFvwip/zHlhQrQwKr157Gbe95P4lEIn8bmpwLGHt2O1ohvcty2QnYBZxRWABwzXUbWX/GWXg/vYk+ESEIApxzhNksmXT6lP+k02mbYKwAVJWrrt3IhrPORjV/gCuQ3Lknl7OgAsS/oFcBVnS25qJbOAulsVCl1dXXc9WbNhKNRqcMRJl8avf39bL12WfY/sJW+np6yGYyp5wexIeey6+6hrfeeLNFUZkLoLm5hSuuehPPPbO5YPtJH+omOzBMUF9T9nsCFrQAVATxHpDV5BJ55K20JUuXsfb09VNO+okI6XSKhx96kG/deQc7d7zA+NjoZHfv1G2ezWapb2gwAVQA4hznnv8GauvqGBkezju888kJMt39JLqWomVugAUtgEA9EjjnvRZd+lvZtZra2topgz+ZTPK1L/8Td97xRYaHhnDO4VwJdgSqTubyM8odVWX58pU0NDQyPDR0ogBE0HSGbP/g3CWUm0UWdKtVFbyXCFBbLPhaWluJxeNFJ/+899z1ra9zx//9PKPDwwRBYJN3Rt72FK9K0NjUXPgtoccnU1SCARb2Y0sUEXVAomBlALF4ouh+bucc27dt5Rtf+TLJZNKe1kZRAheQSCQoOMD3Hk1nKuK7LuhIEEBEp8wTPdWTPJvN8IP7/h+HDx2c+gSYYUymaC86vLetwGVSlyIMDAzw9KbHrWEb00NfFUGlU9EXgxwTQG93N709PUV7CmEYnvLuwTDMVszGEGNOG+fkRjJ41Tb66msmgJKUMmOjI2Sz+cdsqkpVdTUb3/I2GhqbTkkC6j1vuPgSa9DG9HAOvCccHCF9pIfM4V7C0TFUlaCmmtjSNoKGujlJT175ApDJk19F4rqmuob3f/BDrFl7uh0gMmaxLQp4z8SuvQw/+jRjT79A+kgvfiKFZrOgIJEAl4gTbWsiOzA86ytVlS+AaYzn7NiQMes4Ids/xMC9DzP4w5+ROdo3uct1co57sn1qJkuYzhAOjR6bBTcBGEZZI0Jq72GO/tO3GX1yK4Q+l2m4UHCLzNkEpAnAMGYTJ6T3HebI336VsS07J282XjjLC7YoPpeF7ZztPlxMiBAOjnL0i3e9GvwLrU1aLc1FOxAO7NvL97/3XXq6j5oIFguqDP7wUUaf2LJgLxexIcAcCaC3p5u//fSnWLJ0GTe941auue562js6X3NvgVFROCG97wgD9z+KZrLFr31XnZyJ1lcTzZgAKk8C2WyGrVs28+KOF7jvnru48e23mAgqFYWRx7eQPtg9ZfAHdTVE2pqRwJHpHSAcHMkJYQ48YAKYWw3gXEA2m2XrlmfYuf15E0FFVrPgx5KMPbMdDcPCh89EqL3kHFpuvZ74quWIE9JHehm492GGfvwEms7OugRMAPOEc85EULECgOzAMKl9hwrP9Xil5qIzWfKf3kesowWdvHKsuqme+IpOJHAM/Osjs/6rmgBMBMYsGCDT248fn8j/siquOk7zTdfkgj98dfephrntwE03v4mRJ7eS7R2Y1TkBE4CJwCh1+Av4sSSaLZyf0tVWE1+7Im+dqirR9hZiS9rI9vSbAEwEJoKyYjrHiZWpcwoUeV2c4CIzT2dnAjARGLMQ/662Gil4A7UQjo6RfHEP8eUdJyQWFSekD/WQPtRd8OkvkQBXW8NMT7KYAEwERskNoETbmnE11bn7A06MfzSZZuDen1C1blVOApOTgOKE7NAo/d97kOzAcH4BqCLxGLElrTM+yWYCMBEYs0CksZ74qqWkD/cgQZ4gdsL41l0c/ps7aH7HRhLruhDnSO0/wsD3H2bkZ88UEQxEW5uIreiccZ2bAEwERqlRxdUkqH3DmYxu2lZ0LD/2zA6SO/cQaaoH5wgHh6dx65BSc956Ik0NM85NaAJYQHhVRGRaez+KiaCtoxNMBPMsAai99Fzi//oIqVcOFN4N6ASfnCCdnHh191+x4Fcl0tRA/TUXI9HIjLMG2WGgBUI8CFjX3EBVJCDU6d8381oR/PWn/pRPfOw3+M43vkZPT7cdOppXASixJW003XQNEosVf1If2//vpncOoP7aS6jasKYkKcOsB7Ag2opSG4vwx1dfTM94km++sJvNR3oZz2Zxp9gj+P73vmtDg/lGhMaNl5Hc/jJDD5UgK7X3VJ+7jpZbNiKxCPiZ16cJYOG0FlqrErxx5VLetHIpD+09xLe2z1wENkcwj6jiaqtp/3fvIBwZY3TTVl6b/uukPsp7qk5bSceHbiO6pK0kwW8CWGB4FFRpqorzrg1ruK7LRFAJEoguaWPJb76X7i/fzfCjT+duFZruBTWTeQNrzz+D9g/eOtn1L129mQAWZKPJ/WUiqCwJdP7me6lat4qB+35K6uARNPSvztEc+/+xupgM/EhbE43XXUbTzdcS7WguafCbAEwEJoI5lEBQV0PzrddTe8k5jDz2LKNPP09q32F8ciJ3buB4WvAY0c42as7fQN2VF5BYuyK3q9CXvn5MACYCE8EcSgAgtrKTlhU30HTj1WT6Bskc6c2t/XuPq6ki2t5MtK2FoL7m+CUis3UXoQnARGAimGsmn+Sutpp4XTWJVct+4WYwPSYL1Vm/HcgEYCIwEcxbPepkwM9f+ZoATAQmgkWMCcBEYCIwARgmAhOBCcAwEZgITABT0dXegnjwwez+cqrgHFlmkvZAcpMsYTZLGGZ5fbP3qoRhOGvLLCYCoyIEsLy9iVCzRCWGCvgoiJcqRJtQlgHLEOpRqoBoqZpwGBIDTj/lD/BKR8cSbv03/5bUxMSJ+7BVqamto76hsXIbsInAOFUBLG9r40DPvTi5kUDieNWEwBniuQ70MpRzgFYggRIFAkp/ncEpf56qZ+Wq1fzmb328+A8QqfyGayIwTkYAKzubAU9X59tQL9UqerUIvwK8Cehkzm4xL4FB7Fy8icCYngDWt7YyEvGIClKTEj8evwjht4AbgQYrNhOBiaBCBbCqs5GDQZSmMAWqtX4s/kHgt4EuKy4TgYmgsmr+FwSwqq2NQxKnIzuBCO0q8kngV4GElZWJwERQRghoOoN6T5GR+sQvCEBjns7sOCBLUfk08G4sb6CJwERQlgbIDo2imaI3DI8eF8CqzlY0VARpUfgUcPu028tkg5mtehSRGV2Plvv3xT/Az/KpKxOBiWBOqy6bJX2wG82GSFDwGX4oAtC1pDkXAEockd8D3jOdH+KPXWlcFaGuJkZ9bYzqqgjOlW7GXb2y7/AoA0OpU5KAiDA6OsL+fXvxYf7LGiORKF2r1xCPx63lmAjKHxHC4VGSL74yVczszvUARNFMBIn6dwEfIbeWXzjwVQmcsGZlA1dfvIRLzuvg9FUNNNbHiQSuZIuDAkykQ/773zzJ/Q/vIwjkFMpC2LVzO3/y3z7B6MjoCT0BVU9zSyt/8ZnPsWr1GusJmAgqIP6F5M49pPYeKpZmPASejaxe2ob3Hon6tcDHgfqiwe+VzrZqbrvxNG55yxpWLasjGnXH8xeUWGQkJ7LEom5GH5LNZBkaGGRkZPhEAXhPEEQK9g4ME0GZRT9hcoKhBx7Dj44XSz46iMhjkTAM8eKdI/ggcH7R4FflgrPa+Pivnc9lb+gkEji8V8Jw9ipoxnU/+e/FSf65gGOXZ9g+oZKLIDkpgulQ9Kaj9g6TwLQFACOPPcvIk89NdcnI86g+GwHBabAe+DdTBf/l53fyyY9dwplrmwi9Hp8DMEwErxXBxq5l/HjvQf5pyw629fSf1Ee9VgQ7XtjGvXd/m1tuu5233Ph2ElVVlXloq1Q4x8SLe+j9+n34sYncTUOFuU9dttcFkgF4B7C2YPB75Yy1TfzhRy86HvyGYSys4E+9vJ8jn/8mqT0Hpwr+3Qr3iI8QyWqsTdAbC71TFeprY/zG+8/h7HUtFvzGiUjur4HkxCkPAY7hvScWi7H+jLNOHALY0z9v4JMNGdu8je4v301y5yvTuV/w6151pxMhIuj5wJmFBaBcd/lyrr9iRXmOw47dt+DzTyap95ONy9pSqQL/2CTgyQR/vsCfySTgVPs+ZtyWj93iOx+HzGTy9GomS2r/EYYeeIzBH/6MbN/QVE9+gM0oXwxEvIgQAa4AGvMXUu7pf8tb1lBTFSnPp78qkWiEhqZGgkgk7zJgQ2MjLgjK77st0MAPShT4p7okm0mnGR8fp5DVXRBQW1uLyKmvLvmJNOHQCDrHq0cahoTDY6T2HmL8uRcZ3fwC6UPdk9lzpiz3YZS/9E5eCULP3p4+IsB5FFj3V1XWr2nk3A0tlGvPX1U5ff0Z/Nmn/67oRqCOziW2B6DMAx/AuYCnnnycL/3jP5DJZE54QHuvLFu+gt/7wz+msbHp1HoCIgz+4GeMPrVtTnuO6j2aTBGOjROOJdGJ1Ku9kKnLPgT+QdHvOs/x90coMvmnCuduaKWxPl62yzCqSm1tHWeedc6UDdIo38B/TWwyONDP81u3kE6nT+jxee8ZHxsjm8nO6OdkuvvIHO2dn8qYrI9pXzCa42sCfykiaRFhz5He4wJYWuhfRCOOVcvriEQcYVi+AWKbSSo/8F9vAecC3LE9Hq/DOVeSn0F5JJlR4F9A/sDj+xFl/5GB4y9GgNr8QQPRmKO5IY7NkFngl0XgG68nCXxJkT8WtLu3up+l4x2/8IYIUPAEjHNCLGqTYxb4FvhlyF7grxT5kqBjVZERWsfa2d199AQByBTtwbDAt8AvH4aBexH5TJVv3pSUfnUog9kmjr4u+I8JwLDAr8DA1yKvVNyQVoHDwMPAV0F/gsr4BLlt2HuOFt6OPWMB5DZoadFG5uZ7skQVP8UkYEkmhizwF8QTX45PAgZ55+lyk4MlCbq5NomSW87LkBvf9wJbgcdBHlJ0hyAToAy682jyT7Hv6FDRD5yRAJwTHnrsAD96dH/eJCDqYf2aRt5902kkYsG8eFfEsXfPbu769jdyF4PkKdKaulpuf98HaG1rr+zVgkXQ1ffec+bZ5/KxT/zXvPs+FKWhvpHqmtqZ/qh7gB8wRe6MEpMBxsl18w8iekiRAaeaPNZqPSmECMOHH2R4Gh84IwGIE57b3seXv7Mjb7KOMFSuv3I5t7x1DYl4MC+LCeKEo0cPc/e3vpE3H4D3SmtbOze9/ZbKPXa6iMb4qkrXqtWsXrOWwhNYuevgZljXjwCfm98vm8u5kCWCQ9l/tOekP2LGQwBxEAmEIE/eMRHNdbfmtZBAEIJIhCA4cSuwc0oQBOWypmuBP00JhLO/RTcA2He0r6ybiE0CViI2q2+YACzwLfANE4AFvgW+YQKwwLfAN2ZBAOohGyqKnjDZF3qP9/O87UJySz9hNiQMw7xZgX0Ylle2GQv84sUjMuW+jtCyQJdAAF45a10z//Yd6/Ju9vGayyUYjbh5O0+kqrS1d/BL77yViQL7AGrr6qitb1j4S4AW+NMK/v379vLs5qcm9wHICRVeV1/PFW+8hrglGZ2ZAEKvXHvZMq65dGnRCgmczFsvQL2na9UaPvbx/1LwdxDJJZJYsAKwwJ82zjmef24Ln/6zPyGdTp2wvKves3rNaZx3wYUkqqoW/TnXGQ8BnBPcAj8xJJLbB1B2WOCfEl492WyGbDabNyFINsxaftFSCcCwwF/AhVjgFTviagJYgLhculcGxi3wDRPAIkPpTU5w147dfPMFC3zDBLBoEBFG01n++083cWBkjLHMzAL/pnfcytXXXU/75OEmC3xj1gQgMsUlDMqUZ/ENSIUhL/YP5SYsZ/jEb+vozOVAWKyBP/nd1Xs0zySgCbFEAhCBnv4JuvuSeQ/TqUJdTZRlHTV58wUYv0jJbtJZxA1cgfqGRtZtOKPgvQDLV6wkUo6rQgtNAM45vvejl/nsV7bmPQ4ceuWqi5bwvz5+OTXVEVt6KQE2xp+ifMKQiy+7nLPOObdAe1OCIEJtXZ2lip+pABAYT2bpGZggUiAhyNBo2graAn9OicXixOOJou+xNlkKAUxKwBWYBxA39SWNhgX+bGABPlcCMCzwDROAYYFvmAAMC3xjUQlAwSu4PEMuu5TTAn++mGruydplKQSgkIgHNNXH86cF90ptdbQyM+5a4C9YMpkME8lkwRuAAhdQXVNjE9QzFYD3npuuW8X5Z7blPV+lQGN9jEQ8sD0AkyXifUg8nrDAnyWcc2ze9AR3fPEfcxuBXt9mVVm6bDm/8/t/SENj46LvCcxIAKqwrKOWFZ21eV0rkxLw3qJfVYlEopxz3hu46R23WuDPEiJCf18vzz69iXQ6nTcfwNDAAJlMxgqLktwNqIQW31OWUWtbO//pdz7BxZddYYE/+xaYvBvQ5e3mL6p7IGdbAMb0BLB8ZRcrV622wDdMAIsVC3xjoWF9IcMwARhGpaFFXrFJKxOAUbHkcqpKwXV+Swr6KjPMByA8/MRBHnrsYN6EH16Vdasaeddb1xCPBeZdY9bx3rPhrHP46G9/Au9PvP1HVWlobKKmpsYKa6YCECdsfr6Hf/zG8/l3AobK9Vcu5+aNq4jHA8wAxmyjqqxes5a1p68r9ibCMLTtwJToYpBIIHkzAolobi3W2qUxxxIIs1kriOnErxWBYbyOY0+sRdBBWPACmDLrMHayyygxmrtDcIqua0Vs6ljYAtDcECMeCwoLAkinJmyTjVEyQh9O3iQtxYJ/wgQw+/FPJBCqqyKF125F6OvtJZ1K2fFOY+aIkEpOMDjQX+xdWWC0Er5uCQ4DQTZU8g2YQu/xfmbbLiIRR3tLVcGc+SLCvj2vMDo6QqKqyhqwMcP4Fw7s38vQ0GCxB8oEcMgE4JUz1jZx29tOy78PwCtnnd5MNOJmNKGyorOWRDxCKh2ekFtERDh86CAv7dpJe0cnYRhaKzZOGfWe557dzOjISDEBjCLsq4RJwhkJIPTKdVcs55pLlxV8j5PcU/xUy0oVTl/dSH1dlJ6+LK8fl4kIIyPDPPLjh7j40stxLrBWbJwSuVwCffz8kYfxPizWlnapcqQSBpwzngMInBCPuYJ/IpGZ/QhVZVlHDaetbMAXngbgpz9+gB0vvGACMGYkgEd+8iA7XtiGSNF2uykSqxqqhFR3JZkEVC38pxSf3VAX44oLlxC4QvMAjqNHDvH1O77IyMiQTQYaJx8IzvHK7pf4lzvvYGJiolgbGgEeDNNJDYd7TQBzgYhwzSVLaW+pKrLmL/zkoR/xrTu/MnkppEnAmH7w9/f18YV/+Ft27dwxVcagZxSeVCDavsoEMBeoVzasbeLay5YV7FWICOlUiq986Qt86847SE1MWOonY1rB39fbwz985tM89KP7p+rVZ4A7CaTfeWXPnj1l//2DhtrqTxZ6MRZ13HDNSk7rapj3rL6xiKOhPs5PnzzEyHj+J/wxCRybxV299jTq6uutlRt5A19V2f78Nv72r/6cB39wH2EYTtVzfAz4H6KMgjA0liz7ciiblGChV84/s5V33bCW//O1bQVXFUSE8fFxvvHVL7N1yzO887bbuezKq2htbSMIAts2vJiRXCaAVCrFoYP7efAH93Pv3d/mwL69SIEEoq9hGOUz2YgcqU6GvDQwUBFFUlY5AaOB433vXM/m53t4bPORvHsPjklAVXnu2c3s3PECa9aezoUXX8K6DWfSuXQZdXX1BIGtFiwWFMik0wwNDnBg/z5e2LaFZ57axMED+wnDcLpDxX9W3L2RrJKNVM7QsqwE4CeXBH/7g+fzu90/Y++BkYISgFw3L51Ksf35rWzf9hzxRBWJqgSRSNQmCRebBLwnk8mQTI4fvy/AOTfd4H9A4C8gnPBhyL6+IRPAvEnAKxef284ffORCPvmZJznSM15UAvKa1FDpdIp0OmXRsIgRkZPt/W0Cfhc44KMxEvW1YAKYf9561UoyGc+f/5+nOXB0rOAegddXvmGcBE8AH0Vki/ceyWZ46aWXKuoLlu1gxgncvHEV//N3L+OcdS14Vbt/0CgVHrgX+Pd4NqEeAfYf7au4L1q2PYBjsX7dZctZ3lnL339lKz96dD+j4xmcs7yvxinTA3wB9DOI6ybwgLCvAoMfymgfQDERtDZXcdVFS1m1vI7e/iR9AxNkMn5y/G8t2pgWo8D9wO/j9EsgI9n+Plw8wb6j/RX7pSviajDvlZrqCLe8ZS1XXriEHz92kPt+spetL/YxMJQiDDUnAjl2ltCsMJ8sICmH5M71PwLybYQHVXVYNDdxfCgNdFfGen9FCwCOHTxS2luquf3m07nx2i52vjzI5m09bNvVz579w/T0J0llQsJQbUPQfEWcV5IT2WI9SgXGyWXdKXWwh8AYcADYDjwF/AyVl1Q0JQgx5whV2XO4/A/6LCoBvCqC3GRgXU2Ui89t55Jz2xmfyDKezDI8mmZ4NE1yIksmazkE5xonwp6DI3zq85sZGkkX6gmMAn8E8hwlm6RWBSZQxoB+0BERRhSyx3qDsWyE0Hl29/Qsqjqp2NuBc8eRc4+ZRDwgEY/Q0pQAbAAwjwageVd/LkMUWqgmsqL6pAo/L/nPf82PU4TQx3GSZX9396KtkkVxPfix4YH1+uc5/snN10zzrRU7877Q6sQwDBOAYRgmAMMwTACGYZgADMMwARiGYQIwDMMEYBiGCcAwDBOAYRgmAMMwTACGYZQPC/IwkHOznMlHc+fSDcMEsMDIZD1PPddN/+DE7KSOUaW2JsZlF3QQj9nlIIYJYMEgAuPJLJ/96lY2Pdc9rVTfJ4tX5bSuRr78lxtJxCOWGcgwASw0UhnPRCoseuHHTASQSocW+IaxUAUg5HoDszECEIt7wziOrQIYhgnAMAwTgGEYi4oZzwHkxuqlGayL5O78myptby71txb5HCn+O0lur4FzoGo5gkuJ2h2Ni0cAAgwOpxkaSVGKZNsiMDyaJpUKi76vsamJ2rr6vBIQEcbHxhgc6M8vCYFMxrP/8Cjjyaw11lIGP0pddZSmxoSlXl8MAnCB4zv37+Zzd24r2Zq9KgyOpIouAb77vb/Cre9+D2EY5vmdAh64/z7+7tN/TiaT5vViciIcOjrKh//rj3M/wwRQMkKv3PLmNfzef7iASGCjy4oXAAJj4xmO9IwTBCUaBjD1kKK2ro72jk6y2RMFEEQC6hsaQATV/EuJ2VDp6Uta7JdaAKEyNJq2glg0ApiMWCe5J+tcoap4VVRPvN5LveS6/lNEt4hdIV7yehG7dancsH6aYZgADMMwARiGsagoyVmA3E28pfulpppOkGP/5Xljbmwv0/qdjdKiqjaxuqgEoBCLBtTWRAlKtOyjqqRSYdGEHal0irGxEcJ8qwBBQCo1Qe4C6Pw4JyTiQck2MBk5wtCTsBwLi0cA3is3XL2SdasbS3JyTxDGxjN85p+fY+fLAwX3Atx3z108+/SmghuBuo8eJRuGebsSqkpHaw2f+PAFNNTH7VhwCVGFpe01BM5GlotCAKrKquX1rFlRX5rfRoSh4RT/fNeOol3JV3bvYveuF4t8jOAKNEJVqKmK8MaLltDWWg2WGqzkEvAm1cUhgGMSCEtU3yJK6HN7yaXo+xxBMJPfObdrzYdqPQBjUWN9NWMBYnMzcymAgidvlNw43zBKhfdTrhSoFmmTRukFkMz7iuRmdceTWSsloyQIuaSvYegp8pQPEU1aac2dAAYLVVYq7TnaOz4vv5j1OyrTAEd6x5koftw7DTJihTU3RIC9wPJ8L3qvvPjKEBMTIbGom7OgDL3mnhKzkKzDe7sUZL7ItadBkhPZYse9u4FhK625E8CLwJX5XhSBLdt7Odwzxqrl9ehsB45CIh7w3ptP55pLls7WvSC0NCaoqYpi/Yy5QySXPGbTc91TlfrLojJmiZrmTgCbgPcAide/6Jyw7/AIDz9xiFXL62f9l1EgHgt4902nMat3g6kShpa6ai5xIjy1tZvnd/VPdXR8iw/8uMvaAtUcCUB/DtINrMz3hkzG8537d7PxiuUsX1I7J6sCYajY07lyEBEGR9J88/svMTKaLtb9HwYeF2+P/7nCOeFF4OfF3rD1xT7uuHsnqXSIbZ83ThZV5a4f7OaRTYemOn/xPMozKOzt6bWCmwsBeJUkyj3ARKE3eQ933vMi37l/N96rScCYfgMT4aHHDvK5O58nmcoWazsK3EMovTjr/c0VQUNtNYgcITcRuCrfm0RgIh2yZXsfDXUx1q1pIhpxNoY2CiKTORl/9LP9/M/PPsX+w6NT3fX4Iugf4egDYWjMtgLMiQDq62pw6scRyQA3ANFCFTqWzPDkc92MjmVYvbyehvq4Hak1fgEngnNC78AEX7l7J3/1T89y8MiUwR8C/zszVnePi2bY391nBTlHyIqOlmPdslqUfyS3IlAQ1dy8wDnrmnnX29ZyzSVL6WyroSph58AXeVMilc7S2z/BY88c4dv/uptNW7tJZ8LpJIz9KXA7cBgV9nXb+H/uag246GLo2d+MqpwL3AmcNdU/9F6JRh0rltRy3oZW1q9ppKO1mupExOYIFhGqueFhT3+Sl/YOsWV7L68cGGFiIou4aWVePgz6K4I8kEE5dLTfCnWuBbC8rY2oeJLOEVN/K/A5oH06H+Anj+86J8RjLpcMwgSwqAhDJZ0JCUM9flXcNB8CY8DvQ+azEFEVYf8R6/7PuQAAVnU04xGyEnERzf574C+AxpP5MD3+l7HoGtLJSz8FfEpE/5dqbgVqnz39508AACs6WhEUVCOI/Crwp0yzJ2AYJ8Eo8GlV/UsRGcsFvz3554NfmLkbHhunobYaFfFZdc8GoruBs00CRgnZD/wh4v5eJo+iW/AvEAEADI0laaitxolqRNiu8CjQAKwBYlZkximSBX4I/HZfNvXdaheEIBb880zBkduKjhZUBScekBrgZuDDwOXkOThkGEUCfxvwZYWvodp7bMJgvwX/whUAwIr2dmpruxkba0F9iAtci6pcD/wS8Eag02Rg5CEN9AHPAN8D7nOaOuAlTiSIEPqQvUdsrX/BC+AYXZ3t4ALUp0FBRBOqsg64ArgYWE/uNGEjUE2eoYVRsXhyY/kh4ACwC3h68pTpDsEPKY5c8ill31EL/IXE/wf838yPRB04ygAAAABJRU5ErkJggg=='
$iconBytes       = [Convert]::FromBase64String($iconBase64)
$stream          = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);
$iconImage       = [System.Drawing.Image]::FromStream($stream, $true)
$Form.Icon       = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())


$label                           = New-Object system.Windows.Forms.Label
$label.text                      = "LA ACCION SE REALIZARA EN :"
$label.AutoSize                  = $true
$label.width                     = 40
$label.height                    = 30
$label.location                  = New-Object System.Drawing.Point(35,10)
$label.Font                      = 'Comic Sans MS,10'
$Form.Controls.Add($label) 
######################

 
###################

#####################






function Ubicacion{
    $dataGridView.Rows.Clear()
                $dataGridView.DataSource = $null
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "TXT (*.txt)| *.txt"
    $OpenFileDialog.ShowDialog() | Out-Null
 $prueba2= Get-Content $OpenFileDialog.FileName

 $acumulador=0;
 $acumulador2=0;
 $acumulador3=0;
 $acumulador4=0;
 $acumulador5=0;
 $acumulador6=0;
 

foreach($prueba1 in $prueba2){
   
    $hola=$prueba1.Trim();
$valor=$hola.split(".");
$resultado=$valor[2]
if($resultado -eq '60'){
$acumulador++;

}
else{
    if($resultado -eq '61'){
        $acumulador2++;
        
        }
        else{
            if($resultado -eq '62'){
                $acumulador3++;
                
                }
                else{
                    if($resultado -eq '63'){
                        $acumulador4++;
                        
                        }
                        else{
                            if($resultado -eq '64'){
                                $acumulador5++;
                                
                                }
                                else{
                                    if($resultado -eq '65'){
                                        $acumulador6++;
                                        
                                        } 
                                }
                        }
                }
        }
}




}

$totalRegistros=$acumulador+$acumulador2+$acumulador3+$acumulador4+$acumulador5+$acumulador6;









 $dataGridView.Size=New-Object System.Drawing.Size(240,230)
 $dataGridView.Location= New-Object System.Drawing.Point(460,55)
 $Form.Controls.Add($dataGridView)
 $dataGridView.ColumnCount = 2
 $dataGridView.ColumnHeadersVisible = $true;
 $dataGridView.Rows.Add('Registros RED 60',$acumulador)
 $dataGridView.Rows.Add('Registros RED 61',$acumulador2)
 $dataGridView.Rows.Add('Registros RED 62',$acumulador3)
 $dataGridView.Rows.Add('Registros RED 63',$acumulador4)
 $dataGridView.Rows.Add('Registros RED 64',$acumulador5)
 $dataGridView.Rows.Add('Registros RED 65',$acumulador6)
 $dataGridView.Rows.Add('Registros INVALIDOS',$totalRegistros)
 $dataGridView.Rows.Add('TOTAL DE REGISTROS',$totalRegistros)
 $dataGridView.Columns[0].width='140'
 $dataGridView.Columns[1].width='50'
 $dataGridView.Columns[0].Name = "Número de Registros"
 $dataGridView.Columns[1].Name = "Cantidad"

}



#Creación de un nuevo formulario
function rutasPredeterminadas{
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
    ############### CREACION DEL ELEMENTO ############
    $Form1 = New-Object System.Windows.Forms.Form 
    
   
    $Button10 = New-Object 'System.Windows.Forms.Button'
    $textbox19 = New-Object 'System.Windows.Forms.TextBox'
    $textbox20 = New-Object 'System.Windows.Forms.TextBox'
    $Button11 = New-Object 'System.Windows.Forms.Button'
    $label11  = New-Object 'system.Windows.Forms.Label'
    $label12 = New-Object 'system.Windows.Forms.Label'
    $label13= New-Object 'system.Windows.Forms.Label'
    $label14= New-Object 'system.Windows.Forms.Label'
    $label15= New-Object 'system.Windows.Forms.Label'

#Etiqueta de Ruta de Ubicación


$label11.text                      = "Servidor Proxy"
$label11.AutoSize                  = $true
$label11.width                     = 40
$label11.height                    = 30
$label11.location                  = New-Object System.Drawing.Point(55,25)
$label11.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label11) 


$label12.text                      = "Excepción 1:"
$label12.AutoSize                  = $true
$label12.width                     = 40
$label12.height                    = 30
$label12.location                  = New-Object System.Drawing.Point(55,80)
$label12.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label12) 


$label13.text                      = "Excepción 2:"
$label13.AutoSize                  = $true
$label13.width                     = 40
$label13.height                    = 30
$label13.location                  = New-Object System.Drawing.Point(55,130)
$label13.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label13) 

$label14.text                      = "Excepción 3:"
$label14.AutoSize                  = $true
$label14.width                     = 40
$label14.height                    = 30
$label14.location                  = New-Object System.Drawing.Point(55,180)
$label14.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label14) 

$label15.text                      = "Excepción 4:"
$label15.AutoSize                  = $true
$label15.width                     = 40
$label15.height                    = 30
$label15.location                  = New-Object System.Drawing.Point(55,230)
$label15.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label15) 


    ############TextBox Ruta de Ubicación
	$textbox11.Font = 'Comic Sans MS,10'
	$textbox11.Location = '200,25'
	$textbox11.Margin = '5, 5, 5, 5'
	$textbox11.Multiline = $True
	$textbox11.Name = 'textbox5'
	$textbox11.Size = '300, 30'
    $textbox11.TabIndex = 1
    $textbox11.Enabled=$false
	$textbox11.add_TextChanged($textbox1_TextChanged)


    $Form1.Controls.Add($textbox11)
    $peru = $textbox1.Text
    $arreglo = $peru.Split(".");

if($arreglo[2] -eq '60'){
        $array = $arreglo[0] + "." + $arreglo[1] + "." + $arreglo[2] + "." + "102"+":3128"
        $textbox11.Text = $array
}
else{
        $array = $arreglo[0] + "." + $arreglo[1] + "." + $arreglo[2] + "." + "7"+":3128"
        $textbox11.Text = $array
}


    $Form1.Size = New-Object System.Drawing.Size(1100,750)  
    $Form1.StartPosition = "CenterScreen" 
    $Form1.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Sizable
    $Form1.MaximizeBox = $false
    $Form1.Text = "CONVERTIDOR DE AUDIO" 
    

    $textbox12.Font = 'Comic Sans MS,10'
    $textbox12.Location = '200,80'
    $textbox12.Margin = '5, 5, 5, 5'
    $textbox12.Multiline = $True
    $textbox12.Name = 'textbox5'
    $textbox12.Size = '300, 30'
    $textbox12.TabIndex = 1
    $textbox12.Enabled = $false
    $textbox12.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox12)


    $textbox13.Font = 'Comic Sans MS,10'
    $textbox13.Location = '200,130'
    $textbox13.Margin = '5, 5, 5, 5'
    $textbox13.Multiline = $True
    $textbox13.Name = 'textbox5'
    $textbox13.Size = '300, 30'
    $textbox13.TabIndex = 1
    $textbox13.Enabled = $false
    $textbox13.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox13)

    $textbox14.Font = 'Comic Sans MS,10'
    $textbox14.Location = '200,180'
    $textbox14.Margin = '5, 5, 5, 5'
    $textbox14.Multiline = $True
    $textbox14.Name = 'textbox5'
    $textbox14.Size = '300, 30'
    $textbox14.TabIndex = 1
    $textbox14.Enabled = $false
    $textbox14.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox14)

    $textbox15.Font = 'Comic Sans MS,10'
    $textbox15.Location = '200,230'
    $textbox15.Margin = '5, 5, 5, 5'
    $textbox15.Multiline = $True
    $textbox15.Name = 'textbox5'
    $textbox15.Size = '300, 30'
    $textbox15.TabIndex = 1
    $textbox15.Enabled = $false
    $textbox15.add_TextChanged($textbox1_TextChanged)
    $Form1.Controls.Add($textbox15)


    $textbox12.Text = "192.9.100.*"
    $textbox13.Text = "10.10.10.*"
    $array = $arreglo[0] + "." + $arreglo[1] + "." + $arreglo[2] + "." + "*"
    $textbox14.Text = $array
    $textbox15.Text = "<local>"

  
      $Form1.Controls.Add($Button10)
    $Button10.Location = New-Object System.Drawing.Size(520,600) 
    $Button10.Size = New-Object System.Drawing.Size(150, 50) 
    $Button10.Text = "RUTAS PREDETERMINADAS" 
    $Button10.UseVisualStyleBackColor = $True
    $Button10.BackColor = [System.Drawing.Color]::LightBlue
    $Button10.Add_Click( { 
            $textbox11.Enabled = $true
            $textbox12.Enabled = $true
            $textbox13.Enabled = $true
            $textbox14.Enabled = $true
            $textbox15.Enabled = $true
        if ($arreglo[2] -eq '64') {
           
            $textbox16.Enabled = $true
            $textbox17.Enabled = $true
             $textbox18.Enabled=$true}
    
     }) 
      
   
     $textbox19.Font = 'Comic Sans MS,10'
     $textbox19.Location = '600,50'
     $textbox19.Margin = '5, 5, 5, 5'
     $textbox19.Multiline = $True
     $textbox19.Name = 'textbox5'
     $textbox19.Size = '300, 30'
     $textbox19.TabIndex = 1
     $textbox19.Enabled = $false
     $textbox19.add_TextChanged($textbox1_TextChanged)
   $Form1.Controls.Add($textbox19)

   $textbox20.Font = 'Comic Sans MS,10'
   $textbox20.Location = '600,150'
   $textbox20.Margin = '5, 5, 5, 5'
   $textbox20.Multiline = $True
   $textbox20.Name = 'textbox5'
   $textbox20.Size = '300, 30'
   $textbox20.TabIndex = 1
   $textbox20.Enabled = $false
   $textbox20.add_TextChanged($textbox1_TextChanged)
 $Form1.Controls.Add($textbox20)
 


 $movistarChile="192.9.64.0/25"
 $financieroChileJuanJo="192.9.62.128/26"
 $financieroChilePatricia="192.9.62.192/26"
 $Oncosalud="192.9.64.128/26"
 $cajaArequipa="192.9.64.0/26"
 $carteraPropia="192.9.65.128/25"
 $mesaDigital="192.9.61.100/32"
 $bbva="192.9.64.192/26"

[int]$arregloModificado=$arreglo[3]
#Mascara25
$movistarMask=($arregloModificado -ge 0 -and $arregloModificado -le 127)
$carteraMask=($arregloModificado -ge 128 -and $arregloModificado -le 255)
#Mascara26
$financieroMaskJuanJo=($arregloModificado -ge 128 -and $arregloModificado -le 191)
$financieroMaskPatricia=($arregloModificado -ge 192 -and $arregloModificado -le 255)
$OncosaludMask=($arregloModificado -ge 128 -and $arregloModificado -le 191)
$cajaArequipaMask=($arregloModificado -ge 0 -and $arregloModificado -le 63)
$bbvaMask=($arregloModificado -ge 192 -and $arregloModificado -le 255)
#




if($arreglo[2] -eq '64'){

    if( $movistarMask){

        $label16                           = New-Object system.Windows.Forms.Label
        $label17                           = New-Object system.Windows.Forms.Label
        $label16.text                      = "Excepción 5:"
        $label16.AutoSize                  = $true
        $label16.width                     = 40
        $label16.height                    = 30
        $label16.location                  = New-Object System.Drawing.Point(55,270)
        $label16.Font                      = 'Comic Sans MS,10'
        $Form1.Controls.Add($label16) 

       
$label17.text                      = "Excepción 6:"
$label17.AutoSize                  = $true
$label17.width                     = 40
$label17.height                    = 30
$label17.location                  = New-Object System.Drawing.Point(55,310)
$label17.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label17) 

$label18                           = New-Object system.Windows.Forms.Label
$label18.text                      = "Excepción 7:"
$label18.AutoSize                  = $true
$label18.width                     = 40
$label18.height                    = 30
$label18.location                  = New-Object System.Drawing.Point(55,350)
$label18.Font                      = 'Comic Sans MS,10'
$Form1.Controls.Add($label18) 







        $textbox16 = New-Object 'System.Windows.Forms.TextBox'
        $textbox16.Font = 'Comic Sans MS,10'
         $textbox16.Location = '200,270'
         $textbox16.Margin = '5, 5, 5, 5'
         $textbox16.Multiline = $True
        $textbox16.Name = 'textbox5'
      $textbox16.Size = '300, 30'
        $textbox16.TabIndex = 1
        $textbox16.Enabled = $false
      $textbox16.add_TextChanged($textbox1_TextChanged)
      $Form1.Controls.Add($textbox16)


      $textbox17 = New-Object 'System.Windows.Forms.TextBox'
      $textbox17.Font = 'Comic Sans MS,10'
      $textbox17.Location = '200,310'
      $textbox17.Margin = '5, 5, 5, 5'
      $textbox17.Multiline = $True
      $textbox17.Name = 'textbox5'
      $textbox17.Size = '300, 30'
      $textbox17.TabIndex = 1
      $textbox17.Enabled = $false
      $textbox17.add_TextChanged($textbox1_TextChanged)
      $Form1.Controls.Add($textbox17)

      $textbox18 = New-Object 'System.Windows.Forms.TextBox'
        $textbox18.Font = 'Comic Sans MS,10'
        $textbox18.Location = '200,350'
        $textbox18.Margin = '5, 5, 5, 5'
        $textbox18.Multiline = $True
        $textbox18.Name = 'textbox5'
        $textbox18.Size = '300, 30'
        $textbox18.TabIndex = 1
        $textbox18.Enabled = $false
        $textbox18.add_TextChanged($textbox1_TextChanged)
      $Form1.Controls.Add($textbox18)

      $textbox16.Text = "192.9.104.*"
      $textbox17.Text = "192.9.106.*"
      $textbox18.Text = "*.telefonicachile.cl"
        $textbox19.Text=$movistarChile
        $textbox20.Text="Movistar Chile"
    }
    else{
        if($OncosaludMask){
            $Form1.Controls.Remove($textbox16)
            $Form1.Controls.Remove($textbox17)
            $Form1.Controls.Remove($textbox18)
            $Form1.Controls.Remove($label16 )
            $Form1.Controls.Remove($label17 )
            $Form1.Controls.Remove($label18 )
            $textbox19.Text=$Oncosalud
            $textbox20.Text="Oncosalud Cobranzas"
        }
        else{
            if($bbvaMask){
                $Form1.Controls.Remove($textbox16)
                $Form1.Controls.Remove($textbox17)
                $Form1.Controls.Remove($textbox18)
                $Form1.Controls.Remove($label16 )
                $Form1.Controls.Remove($label17 )
                $Form1.Controls.Remove($label18 )
                $textbox19.Text=$bbva
                $textbox20.Text="BBVA"
            }
            else{
                $Form1.Controls.Remove($textbox16)
                $Form1.Controls.Remove($textbox17)
                $Form1.Controls.Remove($textbox18)
                $Form1.Controls.Remove($label16 )
                $Form1.Controls.Remove($label17 )
                $Form1.Controls.Remove($label18 )
                $textbox19.Text="Error"
                $textbox20.Text="Error"
            }
        }
    }
}


if($arreglo[2] -eq '62'){
    if($financieroMaskJuanJo){
        $textbox19.Text=$financieroChileJuanJo
        $textbox20.Text="Financiero Chile-Juan José"
    }
    else{
        if($financieroMaskPatricia){
            $textbox19.Text=$financieroChilePatricia
            $textbox20.Text="Financiero Chile-Patricia"
        }
        else{
            if($cajaArequipaMask){
                $textbox19.Text=$cajaArequipa
                $textbox20.Text="Caja Arequipa"
            }
            else{
                $textbox19.Text="Error"
                $textbox20.Text="Error"
            }
        }
    }
}
if($arreglo[2] -eq '65'){
    if($carteraMask){
        $textbox19.Text=$carteraPropia
        $textbox20.Text="Cartera Propia"
    }
    else{
        $textbox19.Text="Error"
        $textbox20.Text="Error"
    }
}


$Button11.Location = New-Object System.Drawing.Size(720,600) 
$Button11.Size = New-Object System.Drawing.Size(150, 50) 
$Button11.Text = "ACEPTAR" 
$Button11.UseVisualStyleBackColor = $True
$Button11.BackColor = [System.Drawing.Color]::LightBlue
$Button11.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Form1.AcceptButton = $Button11
$Form1.Controls.Add($Button11)




    $Form1.Add_Shown({$Form.Activate()})
    [void] $Form1.ShowDialog();


}

function Validacion{
    $regip = [regex]"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
                $validacion = $textbox1.Text -match $regip
                    if ($validacion -eq $False) {
        Add-Type -AssemblyName System.Windows.Forms
        $errorMsg = "IP INCORRECTA"
        $caption = "Error de contenido"
        [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
   
                }else {
        Add-Type -AssemblyName System.Windows.Forms
        $errorMsg = "IP CORRECTA"
        $caption = "Error de contenido"
        [System.Windows.Forms.MessageBox]::Show($errorMsg, $caption)
                }
}


function ejecutarTareas{

	$Username = "Administrador"
    $Password = "R3c542016C4ll"

    $Computer=$textbox1.Text; 
    $serverProxy=$textbox11.Text;
    $excepcion1=$textbox12.Text;
    $excepcion2=$textbox13.Text;
    $excepcion3=$textbox14.Text;
    $excepcion4=$textbox15.Text;
    $excepcion5=$textbox16.Text;
    $excepcion6=$textbox17.Text;
    $excepcion7=$textbox18.Text;
    
    
        
   
      $habilitarProxy={
          Param($Computer,$serverProxy,$excepcion1,$excepcion2,$excepcion3,$excepcion4,$excepcion5,$excepcion6,$excepcion7,$movistarMask)    

        $arregloNuevo=$Computer.Split(".");
        $arregloFinal=$arregloNuevo[2]




          
      #ENABLE SEC    
     #Agregamos claves faltantes para editar el proxy
     New-Item -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft" -Name "Internet Explorer";
     New-Item -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" -Name "Control Panel";
     #Bloqueamos la edición del proxy (No estamos bloqueando pq se borra la config)
     Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" -Name Proxy;
     New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" -Name Proxy -PropertyType DWord -Value 1;
     #Forzamos la configuración por pc y no por usuario
     New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxySettingsPerUser -PropertyType DWord -Value 0;
    

     #ENABLE PROXY
     Remove-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable;
     #Configurando valores predeterminados del proxy para PC
     New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyServer -Value "$serverProxy";
     New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable -PropertyType DWord -Value 1;
if($arregloFinal -eq '64' ){
    if($movistarMask){
        New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyOverride -Value "$excepcion1;$excepcion2;$excepcion3;$excepcion5;$excepcion6;$excepcion7;$excepcion4";
    }
    else{
        New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyOverride -Value "$excepcion1;$excepcion2;$excepcion3;$excepcion4"; 
    }
}
   
     
     Remove-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable;
     New-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyServer -Value "$serverProxy";
     New-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable -PropertyType DWord -Value 1;
     if($arregloFinal -eq '64' ){
        if($movistarMask){
            New-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings"-Name ProxyOverride -Value "$excepcion1;$excepcion2;$excepcion3;$excepcion5;$excepcion6;$excepcion7;$excepcion4";
        }
        else{
            New-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyOverride -Value "$excepcion1;$excepcion2;$excepcion3;$excepcion4"; 
        }
    }


  
     #Lanzamos ie para que actualize la config proxy
     #& `"C:\Archivos de programa\Internet Explorer\iexplore.exe`"
    
    

    }  
    $SecurePassword = ConvertTo-SecureString -AsPlainText $Password -Force
    $Cred = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $Username, $SecurePassword
        $Session = New-PSSession -ComputerName $Computer -Credential $Cred
        #Write-Host " $Computer ..." -ForegroundColor GREEN -Background BLACK
        
         #Invocando comandos
         $Job = Invoke-Command -Session $Session  -ScriptBlock $habilitarProxy -ArgumentList ($Computer,$serverProxy,$excepcion1,$excepcion2,$excepcion3,$excepcion4,$excepcion5,$excepcion6,$excepcion7,$movistarMask) -AsJob 
         $Null = Wait-Job -Job $Job
        Remove-PSSession -Session $Session
     
          
        
        
        
     
         
  




}



























###############################

$computerNames = @('IP','RANGO DE IPS','ARCHIVO TXT')
$comboBox1 = New-Object System.Windows.Forms.ComboBox
$comboBox1.Font = 'Segoe UI, 12pt'
$comboBox1.Location = New-Object System.Drawing.Point(35,50)
$comboBox1.Size = New-Object System.Drawing.Size(200, 40)

 
foreach($computer in $computerNames)
{
  $comboBox1.Items.add($computer)

}
$comboBox1.add_SelectedIndexChanged({

    if($comboBox1.SelectedItem -eq 'IP'){
        $dataGridView.Rows.Clear()
        $dataGridView.DataSource = $null
        $Form.Controls.Remove($dataGridView)
        $Form.Controls.Remove($textbox2)
        $Form.Controls.Remove($textbox3)
        $Form.Controls.Remove($Button)
        $Form.Controls.Add($textbox1)
              $Form.Controls.Add($Button2)	
              $Form.Controls.Add($Button3)
       
        $Form.Controls.Add($Groupbox1)
        $Groupbox1.Controls.Add($comboBox2)
        $Form.Controls.Remove($label2)
        $Form.Controls.Remove($label3)
        $textbox1.Font = 'Comic Sans MS,10'
        $textbox1.Location = '300,50'
        $textbox1.Margin = '5, 5, 5, 5'
        $textbox1.Multiline = $True
        $textbox1.Name = 'textbox5'
        $textbox1.Size = '200, 30'
        $textbox1.TabIndex = 1
        $textbox1.add_TextChanged($textbox1_TextChanged)

###################################

            $Button2.Location = New-Object System.Drawing.Size(520, 600) 
            $Button2.Size = New-Object System.Drawing.Size(150, 50) 
            $Button2.Text = "RUTAS PREDETERMINADAS" 
            $Button2.UseVisualStyleBackColor = $True
            $Button2.BackColor = [System.Drawing.Color]::LightBlue
            $Button2.Add_Click( { Validacion }) 
      

            $Button3.Location = New-Object System.Drawing.Size(640, 600) 
            $Button3.Size = New-Object System.Drawing.Size(150, 50) 
            $Button3.Text = "EJECUTAR" 
            $Button3.UseVisualStyleBackColor = $True
            $Button3.BackColor = [System.Drawing.Color]::LightBlue
            $Button3.Add_Click( { ejecutarTareas }) 





#######################################
$Groupbox1.height                = 190
$Groupbox1.width                 = 1000
$Groupbox1.text                  = "Proxy"
$Groupbox1.location              = New-Object System.Drawing.Point(20,110)

######################################

$datos = @('HABILITAR PROXY', 'DESHABILITAR PROXY')
$comboBox2.Font = 'Segoe UI, 12pt'
$comboBox2.Location = New-Object System.Drawing.Point(20,40)
$comboBox2.Size = New-Object System.Drawing.Size(200, 40)

foreach($computer1 in $datos)
{
  $comboBox2.Items.add($computer1)

}
$comboBox2.add_SelectedIndexChanged({
    if($comboBox2.SelectedItem -eq 'HABILITAR PROXY'){
        $Groupbox1.Controls.Add($comboBox3)
        $datos1 = @('Predeterminado', 'Personalizado')
        $comboBox3.Font = 'Segoe UI, 12pt'
        $comboBox3.Location = New-Object System.Drawing.Point(300,40)
        $comboBox3.Size = New-Object System.Drawing.Size(200, 40)
        foreach($computer2 in $datos1)
{
  $comboBox3.Items.add($computer2)
}
$comboBox3.add_SelectedIndexChanged({
    ##########################################
    $Button1.Location = New-Object System.Drawing.Size(520,40) 
    $Button1.Size = New-Object System.Drawing.Size(150,50) 
    $Button1.Text = "RUTAS PREDETERMINADAS" 
    $Button1.UseVisualStyleBackColor = $True
    $Button1.BackColor = [System.Drawing.Color]::LightBlue
    $Button1.Add_Click({rutasPredeterminadas}) 
    $Groupbox1.Controls.Add($Button1)	

})
    }
    else{
        if($comboBox2.SelectedItem -eq 'DESHABILITAR PROXY'){

        }
    }



})

#$ComboBox2.text                  = "comboBox"



    }
    else{
        if($comboBox1.SelectedItem -eq 'RANGO DE IPS'){
            $dataGridView.Rows.Clear()
            $dataGridView.DataSource = $null
            $Form.Controls.Remove($dataGridView)
            $Form.Controls.Remove($textbox1)
            $Form.Controls.Remove($Button)
            $Form.Controls.Add($label2)	
            $Form.Controls.Add($label3) 
            $Form.Controls.Add($textbox2)
            $Form.Controls.Add($textbox3)
            $label2.text                      = "IP INICIAL"
$label2.AutoSize                  = $true
$label2.width                     = 40
$label2.height                    = 30
$label2.location                  = New-Object System.Drawing.Point(250,50)
$label2.Font                      = 'Comic Sans MS,10'

$label3.text                      = "IP FINAL"
$label3.AutoSize                  = $true
$label3.width                     = 40
$label3.height                    = 30
$label3.location                  = New-Object System.Drawing.Point(650,50)
$label3.Font                      = 'Comic Sans MS,10'


            $textbox2.Font = 'Segoe UI, 12pt'
$textbox2.Location = '360,50'
$textbox2.Margin = '5, 5, 5, 5'
$textbox2.Multiline = $True
$textbox2.Name = 'textbox5'
$textbox2.Size = '200, 30'
$textbox2.Enabled=$True
$textbox2.TabIndex = 1

$textbox3.Font = 'Segoe UI, 12pt'
	$textbox3.Location = '720,50'
	$textbox3.Margin = '5, 5, 5, 5'
	$textbox3.Multiline = $True
	$textbox3.Name = 'textbox5'
    $textbox3.Size = '200, 30'
    $textbox3.Enabled=$True
	$textbox3.TabIndex = 1
        }
        else{
            if($comboBox1.SelectedItem -eq 'ARCHIVO TXT'){
                $dataGridView.Rows.Clear()
                $dataGridView.DataSource = $null
                $Form.Controls.Remove($dataGridView)
                $Form.Controls.Remove($label2)
                $Form.Controls.Remove($label3)
                $Form.Controls.Remove($textbox1)
                $Form.Controls.Remove($textbox2)
                $Form.Controls.Remove($textbox3)
                $Form.Controls.Add($Button)	
                $Button.Location = New-Object System.Drawing.Size(300,50) 
                $Button.Size = New-Object System.Drawing.Size(150,50) 
                $Button.Text = "Seleccionar Archivo" 
                $Button.UseVisualStyleBackColor = $True
                $Button.BackColor = [System.Drawing.Color]::LightBlue
                $Button.Add_Click({Ubicacion}) 
              
                
            }
        }
    }
  
})
$Form.Controls.Add($comboBox1)

























$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog();
