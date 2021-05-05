import json, requests

def get_activity(num_participants):
	num_part=str(num_participants)
	response=requests.get('https://www.boredapi.com/api/activity?participants='+num_part)

	##if response.status_code != 200:
	if num_participants > 5:
	 	res_activity= response.json()
		print("For "+num_part+" participants, an error occured."+str(res_activity)) 
	else:
		res_activity= response.json().get("activity","none")
		print("For "+num_part+" participants, the activity we found is \'"+res_activity +"\'")


def main():
	while True:
		try:
			num=int(input("Enter a number to get an activity / any character to see all activities / 0 to quit: "))
			if num == 0:
				break
			else:
				get_activity(num)
		except:
			i=1
			while i < 7:
				get_activity(i)
				i += 1

if __name__ == '__main__':
	main()
